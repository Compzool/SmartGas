import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:smartgas/views/dashboard/components/nextBody.dart';

import 'components/body.dart';

class Dashboard extends StatelessWidget {
  static String routeName = "/login_success";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: const BoxDecoration(
          // color: Colors.white,

          gradient: LinearGradient(
            colors: [
              Color.fromARGB(70, 255, 235, 59),
              Color.fromARGB(70, 244, 67, 54),
              Color.fromARGB(70, 63, 81, 181),
              Color.fromARGB(70, 0, 150, 135),
            ],
            stops: [
              0.1,
              0.4,
              0.6,
              0.9,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          // image: DecorationImage(
          //   image: AssetImage('assets/images/eco11.jpg'),
          //   fit: BoxFit.cover,
          //   opacity: 0.6,
          // ),
        ),
        //child: Body(),
        child: NextBody(),
      ),
    );
  }
}
