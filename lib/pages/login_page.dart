import 'package:flutter/material.dart';
import 'package:smartgas/controllers/authentication_controller.dart';

var emailController = TextEditingController();
var passwordController = TextEditingController();

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Welcome to",
          style: TextStyle(
            fontSize: 16,
            //color: Color(0xFF1C1C1C),
            color: Color.fromARGB(255, 87, 6, 104),
            height: 2,
          ),
        ),
        //Color.fromARGB(255, 87, 6, 104)
        //Color.fromARGB(255, 5, 12, 110)
        Text(
          "Smart Gas",
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            //color: Color(0xFF1C1C1C),
            color: Color.fromARGB(255, 87, 6, 104),
            letterSpacing: 2,
            height: 1,
          ),
        ),
        Text(
          "Please login to continue",
          style: TextStyle(
            fontSize: 16,
            //color: Color(0xFF1C1C1C),
            color: Color.fromARGB(255, 87, 6, 104),
            height: 1,
          ),
        ),
        SizedBox(
          height: 16,
        ),
        TextField(
          controller: emailController,
          decoration: InputDecoration(
            hintText: 'Email / Username',
            hintStyle: TextStyle(
              fontSize: 16,
              color: Color.fromARGB(83, 18, 32, 230),
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
            //fillColor: Color(0xFFECCB45),
            fillColor: Color.fromARGB(123, 88, 6, 104),
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          ),
        ),
        SizedBox(
          height: 16,
        ),
        TextField(
          controller: passwordController,
          obscureText: true,
          decoration: InputDecoration(
            hintText: 'Password',
            hintStyle: TextStyle(
              fontSize: 16,
              color: Color.fromARGB(83, 18, 32, 230),
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
            //fillColor: Color(0xFFECCB45),
            fillColor: Color.fromARGB(123, 88, 6, 104),
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          ),
        ),
        SizedBox(
          height: 24,
        ),
        GestureDetector(
          onTap: () {
            AuthController.instance.Login(
                emailController.text.trim(), passwordController.text.trim());
          },
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              //color: Color(0xFF1C1C1C),
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(25),
              ),
              boxShadow: [
                BoxShadow(
                  //color: Color(0xFF1C1C1C).withOpacity(0.2),
                  color: Color.fromARGB(123, 88, 6, 104).withOpacity(0.4),
                  spreadRadius: 3,
                  blurRadius: 4,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Center(
              child: Text(
                "LOGIN",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  //color: Color(0xFFF3D657),
                  color: Color.fromARGB(255, 88, 6, 104),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 16,
        ),
        Text(
          "FORGOT PASSWORD?",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            //color: Color(0xFF1C1C1C),
            color: Color.fromARGB(234, 88, 6, 104),
            height: 1,
          ),
        ),
      ],
    );
  }
}
