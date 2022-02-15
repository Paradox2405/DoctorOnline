import 'package:doctor_online/routes/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class StartPageCotroller extends GetxController{
  final _auth = FirebaseAuth.instance;

  @override
  void onReady() {
    if(_auth.currentUser!=null){

      Get.offAndToNamed(Routes.home);
    }
  }

}