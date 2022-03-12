import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:get/get.dart';
import 'package:smartgas/controllers/authentication_controller.dart';


var emailController = TextEditingController();
var passwordController = TextEditingController();

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Sign up with",
          style: TextStyle(
            fontSize: 16,
            //color: Color(0xFFF3D657),
            color: Colors.white,
            height: 2,
          ),
        ),
        Text(
          "Smart Gas",
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            //color: Color(0xFFF3D657),
            color: Colors.white,
            letterSpacing: 2,
            height: 1,
          ),
        ),
        SizedBox(
          height: 16,
        ),
        TextField(
          controller: emailController,
          decoration: InputDecoration(
            hintText: 'Enter Email / Username',
            hintStyle: TextStyle(
              fontSize: 16,
              color: Color(0xFF3F3C31),
              fontWeight: FontWeight.bold,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
            ),
            filled: true,
            //fillColor: Colors.grey.withOpacity(0.1),
            fillColor: Colors.white.withOpacity(0.4),
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          ),
        ),
        SizedBox(
          height: 16,
        ),
        TextField(
          controller: passwordController,
          decoration: InputDecoration(
            hintText: 'Password',
            hintStyle: TextStyle(
              fontSize: 16,
              color: Color(0xFF3F3C31),
              fontWeight: FontWeight.bold,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
            ),
            filled: true,
            //fillColor: Colors.grey.withOpacity(0.1),
            fillColor: Colors.white.withOpacity(0.4),
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          ),
        ),
        SizedBox(
          height: 24,
        ),
        Container(
          height: 40,
          decoration: BoxDecoration(
            //color: Color(0xFFF3D657),
            color: Colors.white.withOpacity(0.9),
            borderRadius: BorderRadius.all(
              Radius.circular(25),
            ),
            boxShadow: [
              BoxShadow(
                //color: Color(0xFFF3D657).withOpacity(0.2),
                color: Colors.white.withOpacity(0.2),
                spreadRadius: 3,
                blurRadius: 4,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Center(
            child: TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.only(left: 120, right: 120),
              ),
              onPressed: () => AuthController.instance.register(
                  emailController.text.trim(), passwordController.text.trim()),
              child: Text(
                "SIGN UP",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1C1C1C),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 24,
        ),
        Text(
          "Or Signup with",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            color: Color(0xFFF3D657),
            height: 1,
          ),
        ),
        SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              onPressed: (() {
                AuthController.instance.google_signIn();
              }),
              icon: Icon(FontAwesome5.google_plus),
              iconSize: 32,
              color: Color(0xFFF3D657),
            ),
            SizedBox(
              width: 24,
            ),
            Icon(
              FontAwesome5.facebook_f,
              size: 32,
              color: Color(0xFFF3D657),
            ),
          ],
        )
      ],
    );
  }
}
