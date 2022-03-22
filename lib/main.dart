import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartgas/controllers/authentication_controller.dart';
import 'package:smartgas/views/dashboard/dashboard_screen.dart';
import 'package:smartgas/views/welcome/liquid_welcome.dart';
import 'package:smartgas/widgets/size_config.dart';

void main() async {
  //WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp().then((value) => Get.put(AuthController()));
  SizeConfig();
  //Get.changeTheme(ThemeData.dark());
  runApp(const MyApp());
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
      //theme: ThemeData.dark(),
      getPages: [
        GetPage(name: '/', page: () => GreetingPage()),
        //GetPage(name: '/', page: () => Dashboard()),
      ],
    );
  }
}
