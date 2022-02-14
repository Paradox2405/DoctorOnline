import 'package:doctor_online/models/notification.dart';
import 'package:doctor_online/routes/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';



class HomePage extends StatefulWidget {
  const HomePage ({Key? key}):super(key:key);


@override
State<HomePage> createState() => _HomePageState();
}

@override
class _HomePageState extends State<HomePage>{
    String notificationTitle = 'No Title';
    String notificationBody = 'No Body';
    String notificationData = 'No Data';

   @override
  void initState() {

    final firebaseMessaging = FCM();
    firebaseMessaging.setNotifications();

    firebaseMessaging.streamCtlr.stream.listen(_changeData);
    firebaseMessaging.bodyCtlr.stream.listen(_changeBody);
    firebaseMessaging.titleCtlr.stream.listen(_changeTitle);

    super.initState();
  }

  _changeData(String msg) => setState(() => notificationData = msg);
  _changeBody(String msg) => setState(() => notificationBody = msg);
  _changeTitle(String msg) => setState(() => notificationTitle = msg);
  @override
  Widget build(BuildContext context) {
    final _auth = FirebaseAuth.instance;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: null,
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 60),
            Expanded(
              child: GestureDetector(
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.blue,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("CHANNEL A DOCTOR\n",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                            Image.asset(
                              'assets/images/doctor.png',
                              scale: 11,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  Get.toNamed(Routes.channeldoctor);
                },
              ),
            ),
            Expanded(
              child: GestureDetector(
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.yellow,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("CONTACT A HOSPITAL\n",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                            Image.asset(
                              'assets/images/hospital.png',
                              scale: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                onTap: () async {

                  if (await Permission.location.request().isGranted) {
                  Get.toNamed(Routes.hospital);
                  }else{
                  Get.snackbar("Error","Please accept location permission");
                  }

                },
              ),
            ),
            Expanded(
              child: GestureDetector(
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("CALL 1990\n",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                            Image.asset(
                              'assets/images/phone.png',
                              scale: 8,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  Get.toNamed(Routes.emergency);
                },
              ),
            ),
            Expanded(
              child: GestureDetector(
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.lightGreenAccent,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("GO BACK\n",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                            Image.asset(
                              'assets/images/back.png',
                              scale: 30,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  _auth.signOut();
                  Get.offAndToNamed(Routes.login);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

}
