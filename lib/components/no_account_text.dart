import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartgas/views/sign_up/sign_up_screen.dart';

import 'package:smartgas/widgets/constants.dart';
import 'package:smartgas/widgets/size_config.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don’t have an account? ",
          style: TextStyle(fontSize: getProportionateScreenWidth(16)),
        ),
        GestureDetector(
          onTap: () => Get.to(
            () => SignUpScreen(),
            duration: Duration(seconds: 1),
            transition: Transition.fade,
          ),
          child: Text(
            "Sign Up",
            style: TextStyle(
                fontSize: getProportionateScreenWidth(16),
                //color: kPrimaryColor,
                color: Color.fromARGB(255, 40, 65, 10)),
          ),
        ),
      ],
    );
  }
}
