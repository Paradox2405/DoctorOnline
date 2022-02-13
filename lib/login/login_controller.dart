import 'package:doctor_online/routes/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class LoginController extends GetxController {
  final _auth = FirebaseAuth.instance;
  final email = TextEditingController();
  final password = TextEditingController();
  bool progress = false;

  login() async {
    if(password.text.length>=6){
        progress = true;
        try {
          final user = await _auth.signInWithEmailAndPassword(
              email: email.text, password: password.text);
          if (user != null) {
            Get.offAndToNamed(Routes.home);
            progress = false;
          }
        } catch (e) {
          print(e);
          progress = false;
          Get.snackbar("Error", "Registration Error: "+e.toString());
        }

    }else{
    Get.snackbar("Error", "Passwords must be at least 6 characters long",duration:const Duration(seconds: 5));
    }
  }
}
