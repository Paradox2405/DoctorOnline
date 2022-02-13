import 'package:doctor_online/routes/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'login/login_bindings.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await initServices();

  runApp(MyApp());
}
Future<void> initServices() async{
  await Firebase.initializeApp();
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Doctor Online',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialBinding: LoginBindings(),
      initialRoute: Routes.start,
      getPages: Routes.routes,
    );
  }

}

