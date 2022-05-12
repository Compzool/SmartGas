import 'package:flutter/material.dart';
import 'package:smartgas/views/electric_car/screens/home_screen.dart';

class ElectricCar extends StatelessWidget {
  const ElectricCar({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        title: 'Tesla Animated App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.black,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
