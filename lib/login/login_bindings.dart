import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class LoginBindings extends Bindings{
  @override
  void dependencies() {
    //Get.lazyPut<GoogleSignInController>(() => GoogleSignInController());
  }

}