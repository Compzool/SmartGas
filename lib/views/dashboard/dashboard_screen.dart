import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

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
          color: Colors.white,
          // image: DecorationImage(
          //   image: AssetImage('assets/images/eco11.jpg'),
          //   fit: BoxFit.cover,
          //   opacity: 0.6,
          // ),
        ),
        child: Body(),
      ),
    );
  }
}
