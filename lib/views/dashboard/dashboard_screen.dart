import 'package:flutter/material.dart';

import 'components/body.dart';

class Dashboard extends StatelessWidget {
  static String routeName = "/login_success";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/eco.jpg'),
            fit: BoxFit.cover,
            opacity: 0.33,
          ),
        ),
        child: Body(),
      ),
    );
  }
}
