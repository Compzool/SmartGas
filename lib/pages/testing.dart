import 'package:flutter/material.dart';
import 'package:smartgas/controllers/authentication_controller.dart';
import 'package:smartgas/widgets/responsive_button.dart';

class TestingPage extends StatelessWidget {
 const TestingPage({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, 
      backgroundColor: Colors.white,
      
      body: Center(
        child: GestureDetector(
          onTap: () => AuthController.instance.Logout(),
          child: Container(
            child: ResponsiveButton(width: 120),
          ),
        ),
      )
    );
  }
}