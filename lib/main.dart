import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartgas/pages/home_page.dart';
import 'package:smartgas/pages/welcome_page.dart';

void main() {
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
      getPages: [
        GetPage(name: '/', page: () => WelcomePage()),
        GetPage(name: '/home_page', page: ()=> HomePage())
      ],
    );
  }
}