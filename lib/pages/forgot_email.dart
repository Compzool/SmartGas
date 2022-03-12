import 'package:flutter/material.dart';
import 'package:smartgas/controllers/authentication_controller.dart';
import 'package:smartgas/widgets/auth_box.dart';

class ForgotEmail extends StatefulWidget {
  const ForgotEmail({Key? key}) : super(key: key);

  @override
  State<ForgotEmail> createState() => _ForgotEmailState();
}

class _ForgotEmailState extends State<ForgotEmail> {
  var emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("MINGLES 4 EVER")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: TextForm(hintText: "Enter your email", controller: emailController),
            ),
            SizedBox(height: 30,),
            Container(
              child: TextButton(
            onPressed:(() => AuthController.instance.resetPassword(emailController.text.trim())) ,
            child: Text("Reset"),
            style: TextButton.styleFrom(primary: Color.fromARGB(255, 88, 6, 104),textStyle: TextStyle(fontSize:24 )),
          ),
            )
          ],
        ),
      ),
    );
  }
}