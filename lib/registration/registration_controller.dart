import 'package:doctor_online/routes/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationController extends GetxController{
  final _auth = FirebaseAuth.instance;
  final email=TextEditingController();
  final password=TextEditingController();
  final username=TextEditingController();
  final passwordretype=TextEditingController();
  bool progress = false;


  registerUser() async{
    if(password.text.length>=6&&username.text.isNotEmpty){
      if (passwordretype.text == password.text) {
        progress = true;
        try {
          final newUser = await _auth.createUserWithEmailAndPassword(
              email: email.text, password: password.text);
          if (newUser != null) {
            Get.toNamed(Routes.login);
            progress = false;
          }
        } catch (e) {
          print(e);
          progress = false;
          Get.snackbar("Error", "Registration Error:"+ e.toString());
        }
      } else {
        progress = false;
        Get.snackbar("Error", "Passwords don't match");
      }
    }else{
      Get.snackbar("Error", "Passwords must be at least 6 characters long & Username cannot be empty",duration:const Duration(seconds: 5));
    }
  }
}