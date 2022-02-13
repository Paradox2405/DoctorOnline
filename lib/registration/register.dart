import 'package:doctor_online/registration/registration_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';

class RegistrationPage extends StatelessWidget {
  final RegistrationController controller = Get.put(RegistrationController());
  RegistrationPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    if(controller.progress==true) {
      ProgressHUD.of(context)!.show();
    }
    return Scaffold(
      appBar: null,
      body: ProgressHUD(
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xff7c94b6),
            image: DecorationImage(
              image: const AssetImage("assets/images/bg2.png"),
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5), BlendMode.dstATop),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: const Text(
                        "LET'S CREATE AN\nACCOUNT",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 300,
                    height: 50,
                    child: TextField(
                      controller: controller.username,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: (18),
                      ),
                      decoration: const InputDecoration(
                        hintText: 'Enter a Username',
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 300,
                    height: 50,
                    child: TextField(
                      controller: controller.email,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: (18),
                      ),
                      decoration: const InputDecoration(
                        hintText: 'Enter E-mail',
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 300,
                    height: 50,
                    child: TextField(
                      controller: controller.password,
                      obscureText: true,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: (18),
                      ),
                      decoration: const InputDecoration(
                        hintText: 'Create a Password',
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  SizedBox(
                    width: 300,
                    height: 50,
                    child: TextField(
                      controller: controller.passwordretype,
                      obscureText: true,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: (18),
                      ),
                      decoration: const InputDecoration(
                        hintText: 'Retype the Password',
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 80,
              ),
              SizedBox(
                height: 40,
                width: 220,
                child: TextButton(
                  child: const Text(
                    'REGISTER',
                    style: TextStyle(color: Colors.blueGrey),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                  onPressed: () {controller.registerUser();},
                ),
              ),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );

  }
}
