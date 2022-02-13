import 'package:doctor_online/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        appBar: null,
        body: Center(child:Column(children:[Container(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Expanded(child:Text(
                    "LET'S LOGIN",
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.grey,
                        fontWeight: FontWeight.w400),
                    textAlign: TextAlign.center,
                  ),),
                ],
              ),
              SizedBox(height: 80),
              Stack(
                clipBehavior: Clip.none, alignment: AlignmentDirectional.topCenter,
                fit: StackFit.loose,
                children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(247, 148, 158, 100)),
                // color: Colors.pinkAccent,
                child:  Column(
                    children: [
                      Row(
                        children: const [
                          Expanded(
                            child: TextField(
                              style: TextStyle(
                                fontSize: (18),
                              ),
                              decoration: InputDecoration(
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
                        children: const [
                          Expanded(
                            child: TextField(
                              obscureText: true,
                              enableSuggestions: false,
                              autocorrect: false,
                              style: TextStyle(
                                fontSize: (18),
                              ),
                              decoration: InputDecoration(
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
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: TextButton(
                              child: Text(
                                'SIGN IN',
                                style: TextStyle(color: Colors.white),
                              ),
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Color.fromRGBO(242, 68, 135, 100))),
                              onPressed: () {
                                Get.offAndToNamed(Routes.home);
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

              ),
                  Positioned(
                    top: -50,
                    child:  Image.asset('assets/images/care.png',scale: 12,),
                  )
                ],
              ),
            ],
          ),
        ),],),),
      );
}
