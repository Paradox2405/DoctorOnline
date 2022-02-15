import 'package:flutter/material.dart';
import 'package:device_apps/device_apps.dart';
import 'package:launch_review/launch_review.dart';

class ChannelDoctor extends StatelessWidget {
  late BuildContext scaffoldContext;

  @override
  Widget build(BuildContext context) {
    scaffoldContext = context;
    return Scaffold(
      appBar: null,
      body: Container(
        decoration: BoxDecoration(
          color: const Color(0xff7c94b6),
          image: DecorationImage(
            image: const AssetImage("assets/images/bg1.png"),
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5), BlendMode.dstATop),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            const Expanded(
              child: SizedBox(
                height: 100,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    child: const Text(
                      "SELECT THE CATEGORY THAT\nYOU WANT TO CHANNEL",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
            const Expanded(
              child: SizedBox(
                height: 80,
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    child: Container(
                      color: Colors.blueGrey,
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Row(
                            children: const [
                              CircleAvatar(
                                radius: 30,
                                backgroundImage: AssetImage(
                                    'assets/images/pediatrician.png'),
                              ),
                            ],
                          ),
                          Row(
                            children: const [Text("Pediatrician")],
                          )
                        ],
                      ),
                    ),
                    onTap: () {
                      _scanSymptom();
                    },
                  ),
                  GestureDetector(
                    child: Container(
                      color: Colors.blueGrey,
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Row(
                            children: const [
                              CircleAvatar(
                                radius: 30,
                                backgroundImage:
                                    AssetImage('assets/images/neuro.png'),
                              ),
                            ],
                          ),
                          Row(
                            children: const [Text("Neurologist")],
                          )
                        ],
                      ),
                    ),
                    onTap: () {
                      _scanSymptom();
                    },
                  ),
                  GestureDetector(
                    child: Container(
                      color: Colors.blueGrey,
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Row(
                            children: const [
                              CircleAvatar(
                                radius: 30,
                                backgroundImage:
                                    AssetImage('assets/images/dermo.png'),
                              ),
                            ],
                          ),
                          Row(
                            children: const [Text("Dermotologist")],
                          )
                        ],
                      ),
                    ),
                    onTap: () {
                      _scanSymptom();
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    child: Container(
                      color: Colors.blueGrey,
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Row(
                            children: const [
                              CircleAvatar(
                                radius: 30,
                                backgroundImage:
                                    AssetImage('assets/images/psychi.png'),
                              ),
                            ],
                          ),
                          Row(
                            children: const [Text("Psychiatrist")],
                          )
                        ],
                      ),
                    ),
                    onTap: () {
                      _scanSymptom();
                    },
                  ),
                  GestureDetector(
                    child: Container(
                      color: Colors.blueGrey,
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Row(
                            children: const [
                              CircleAvatar(
                                radius: 30,
                                backgroundImage:
                                    AssetImage('assets/images/idp.png'),
                              ),
                            ],
                          ),
                          Row(
                            children: const [Text("Disease Physician")],
                          )
                        ],
                      ),
                    ),
                    onTap: () {
                      _scanSymptom();
                    },
                  ),
                  GestureDetector(
                    child: Container(
                      color: Colors.blueGrey,
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Row(
                            children: const [
                              CircleAvatar(
                                radius: 30,
                                backgroundImage:
                                    AssetImage('assets/images/anasthe.png'),
                              ),
                            ],
                          ),
                          Row(
                            children: const [Text("Anasthologist")],
                          )
                        ],
                      ),
                    ),
                    onTap: () {
                      _scanSymptom();
                    },
                  ),
                ],
              ),
            ),
            const Expanded(
              child: SizedBox(
                height: 10,
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  GestureDetector(
                    child: Stack(
                      children: [
                        Container(
                          height: 150,
                          width: MediaQuery.of(context).size.width,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage("assets/images/dentist.jpg"),
                                  fit: BoxFit.fitWidth)),
                        ),
                        Positioned.fill(
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              width: 50,
                              height: 20,
                              color: Colors.orange,
                              child: const Text(
                                ">>>",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 20),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    onTap: () {
                      _scanSymptom();
                    },
                  ),
                  const SizedBox(height: 5,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _scanSymptom() async {
    bool isInstalled = await DeviceApps.isAppInstalled('com.google.ar.lens');
    if (isInstalled) {
      DeviceApps.openApp('com.google.ar.lens');
    } else {
      ScaffoldMessenger.of(scaffoldContext).showSnackBar(const SnackBar(
        content: Text("Install App"),
      ));
      LaunchReview.launch(androidAppId: "com.google.ar.lens");
    }
  }
}
