
import 'package:doctor_online/channeldoctor/channel_doctor.dart';
import 'package:doctor_online/contacthospital/contacthospital_page.dart';
import 'package:doctor_online/emergencycall/emergency_call.dart';
import 'package:doctor_online/fourthview/home_bindings.dart';
import 'package:doctor_online/fourthview/home_page.dart';
import 'package:doctor_online/login/login_bindings.dart';
import 'package:doctor_online/login/login_page.dart';
import 'package:doctor_online/startpage/start_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class Routes{
  static final String start="/start_page";
  static final String login = "/login_page";
  static final String home="/home_page";
  static final String hospital="/contacthospital_page";
  static final String emergency="/emergency_call";
  static final String channeldoctor="/channel_doctor";



  static final routes =[

    GetPage(
      name: Routes.start,
      page: ()=> StartPage(),
    ),
    GetPage(
      name: Routes.login,
      page: ()=> LoginPage(),
      binding: LoginBindings(),
    ),

    GetPage(
      name: Routes.home,
      page: ()=> HomePage(),
      binding: HomeBindings(),
    ),

    GetPage(
      name: Routes.hospital,
      page: ()=> ContactHospital(),
    ),
    GetPage(
      name: Routes.emergency,
      page: ()=> EmergencyCall(),
    ),
    GetPage(
      name: Routes.channeldoctor,
      page: ()=> ChannelDoctor(),
    ),
  ];
}