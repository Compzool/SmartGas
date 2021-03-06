import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartgas/components/default_button.dart';
import 'package:smartgas/controllers/authentication_controller.dart';
import 'package:smartgas/views/dashboard/dashboard_screen.dart';
import 'package:smartgas/widgets/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: SizeConfig.screenHeight * 0.04),
        Image.asset(
          "assets/images/success.png",
          height: SizeConfig.screenHeight * 0.4, //40%
        ),
        SizedBox(height: SizeConfig.screenHeight * 0.08),
        Text(
          "Login Success",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(30),
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Spacer(),
        SizedBox(
          width: SizeConfig.screenWidth * 0.6,
          child: DefaultButton(
            text: "Back to home",
            press: () {
              //Navigator.pushNamed(context, HomeScreen.routeName);
              // Get.off(Dashboard());
              AuthController.instance.Logout();
            },
          ),
        ),
        Spacer(),
      ],
    );
  }
}
