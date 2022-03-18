import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartgas/controllers/phone_controller.dart';


class OtpScreen extends StatelessWidget {
  final loginController = Get.put(LoginController());
  final otp = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: loginController.isLoading(false) ? Center(child: CircularProgressIndicator()) : Center(
          child: Column(
        children: [
          Spacer(),
          TextField(
            controller: otp,
            decoration: InputDecoration(
              hintText: "Enter Auth message",
            ),
          ),
          SizedBox(
            height: 16,
          ),
          ElevatedButton(
            onPressed: ()  {
              loginController.otpVerify(otp.text);
            },
            style: ElevatedButton.styleFrom(primary: Colors.blue,
            onPrimary: Colors.white,),
            child: Text("VERIFY"),
            
          ),
          Spacer(),
        ],
      )),
    );
  }
}