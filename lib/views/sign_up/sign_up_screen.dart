import 'package:flutter/material.dart';

import 'components/body.dart';

class SignUpScreen extends StatelessWidget {
  static String routeName = "/sign_up";
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
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text("Sign Up"),
    //   ),
    //   body: Body(),
    // );
  }
}
