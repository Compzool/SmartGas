import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:get/get.dart';
import 'package:smartgas/colors/colors.dart';
import 'package:smartgas/controllers/authentication_controller.dart';
import 'package:smartgas/widgets/auth_box.dart';

class SignUp extends StatefulWidget {
  
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
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
          height: 10,
        ),
        TextForm(hintText: "Email / Username",controller: emailController,color: AppColors.signupColor,fillColor: AppColors.signupFillColor,),
        SizedBox(
          height: 10,
        ),
        TextForm(hintText: "Password",controller: passwordController,color: AppColors.signupColor,fillColor: AppColors.signupFillColor,isPassword: true),
        SizedBox(
          height: 10,
        ),
        TextForm(hintText: "confirm Password",controller: confirmPasswordController,color: AppColors.signupColor,fillColor: AppColors.signupFillColor,isPassword: true,),
        SizedBox(
          height: 24,
        ),
        GestureDetector(
          onTap: () { 
                confirmPasswordController.text == passwordController.text ? AuthController.instance.register(
                  emailController.text.trim(), passwordController.text.trim()): Get.snackbar("About Signup", "User message",
                  backgroundColor: Color(0xFFECCB45),
                  titleText:  Text("Password doesn't match",
                  style: TextStyle(color: Colors.black),),
      );
                
                  },
          child: Container(
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
              child: Text(
                "SIGN UP",
                textAlign: TextAlign.center,
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
          height: 16,
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
          height: 10,
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
