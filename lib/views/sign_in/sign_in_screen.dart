import 'package:flutter/material.dart';

import 'components/body.dart';

class SignInScreen extends StatelessWidget {
  static String routeName = "/sign_in";
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
    //   // appBar: AppBar(
    //   //   title: Text("Sign In"),
    //   //   backgroundColor: Colors.transparent,
    //   // ),
    //   body: Body(),
    //   backgroundColor: Colors.grey[300],
    // );
  }
}
