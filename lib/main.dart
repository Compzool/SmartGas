import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartgas/bindings/location_binding.dart';
import 'package:smartgas/controllers/authentication_controller.dart';
import 'package:smartgas/controllers/car_controller.dart';
import 'package:smartgas/controllers/information.dart';
import 'package:smartgas/controllers/location_controller.dart';
import 'package:smartgas/controllers/signup_controller.dart';
import 'package:smartgas/controllers/userController.dart';
import 'package:smartgas/views/welcome/liquid_welcome.dart';
import 'package:smartgas/widgets/size_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) => Get.put(AuthController()));
  Get.put<UserController>(UserController());
  Get.put<signUpController>(signUpController());
  Get.put<UserInformation>(UserInformation());
  //Get.put<CarController>(CarController());
  AuthController.instance.Logout();
  SizeConfig();
  //Get.changeTheme(ThemeData.dark());
  await GetStorage.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart Gas',
      initialRoute: '/',
      initialBinding: LocationBinding(),
      //theme: ThemeData.dark(),
      getPages: [
        GetPage(name: '/', page: () => GreetingPage()),
      ],
    );
  }
}
