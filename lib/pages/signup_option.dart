import 'package:flutter/material.dart';

class SignUpOption extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "OR",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              height: 1,
              //color: Color(0xFFF3D657),
              color: Colors.white,
              shadows: [
                // Shadow(
                //   offset: Offset(10.0, 10.0),
                //   blurRadius: 3.0,
                //   color: Colors.white,
                // ),
                Shadow(
                  offset: Offset(0.0, 1.0),
                  blurRadius: 8.0,
                  color: Colors.white,
                ),
              ]),
        ),
        SizedBox(
          height: 24,
        ),
        Container(
          height: 40,
          decoration: BoxDecoration(
            //color: Color(0xFFF3D657),
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(25),
            ),
            boxShadow: [
              BoxShadow(
                //color: Color(0xFFF3D657).withOpacity(0.25),
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
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                //color: Color(0xFF1C1C1C),
                color: Color.fromARGB(221, 88, 6, 104),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
