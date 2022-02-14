import 'package:doctor_online/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:get/get.dart';

import 'login_controller.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: null,
      body:  Center(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                        Expanded(
                          child: Text(
                            "LET'S LOGIN",
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.grey,
                                fontWeight: FontWeight.w400),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 80),
                    Stack(
                      clipBehavior: Clip.none,
                      alignment: AlignmentDirectional.topCenter,
                      fit: StackFit.loose,
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                          decoration: const BoxDecoration(
                              color: Color.fromRGBO(247, 148, 158, 100)),
                          // color: Colors.pinkAccent,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: TextField(
                                      controller: controller.email,
                                      style: const TextStyle(
                                        fontSize: (18),
                                      ),
                                      decoration: const InputDecoration(
                                        labelText: 'Email',
                                        labelStyle: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromRGBO(82, 82, 82, 1),
                                          fontSize: 20,
                                        ),
                                        hintText: 'Email',
                                      ),
                                      textInputAction: TextInputAction.next,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: TextField(
                                      controller: controller.password,
                                      obscureText: true,
                                      enableSuggestions: false,
                                      autocorrect: false,
                                      style: const TextStyle(
                                        fontSize: (18),
                                      ),
                                      decoration: const InputDecoration(
                                        labelText: 'Password',
                                        labelStyle: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromRGBO(82, 82, 82, 1),
                                          fontSize: 20,
                                        ),
                                        hintText: 'Password',
                                      ),
                                      textInputAction: TextInputAction.next,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              Row(
                                children: [
                                  Expanded(
                                    child: TextButton(
                                      child: const Text(
                                        'SIGN IN',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  const Color.fromRGBO(
                                                      242, 68, 135, 100))),
                                      onPressed: () {
                                        controller.login();
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    child:
                                        const Text("Register your self here!"),
                                    onTap: () {
                                      Get.offAndToNamed(Routes.register);
                                    },
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Positioned(
                          top: -50,
                          child: Image.asset(
                            'assets/images/care.png',
                            scale: 12,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

    );
  }
}
