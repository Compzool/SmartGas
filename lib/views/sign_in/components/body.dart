import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartgas/components/no_account_text.dart';
import 'package:smartgas/components/social_card.dart';
import 'package:smartgas/controllers/authentication_controller.dart';
import 'package:smartgas/widgets/size_config.dart';
import '../../../colors/colors.dart';
import 'sign_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color color1 = Color.fromARGB(255, 9, 49, 21);
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () => Get.back(),
                      icon: Icon(
                        Icons.arrow_back_ios_new,
                        color: AppColors.color1,
                      ),
                    ),
                    Text(
                      "Welcome Back",
                      style: TextStyle(
                        //color: Colors.black,
                        color: color1,
                        fontSize: getProportionateScreenWidth(28),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                  ],
                ),
                Text(
                  "Sign in with your email and password  \nor continue with social media",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: color1),
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                SizedBox(
                  child: SignForm(),
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocalCard(
                      icon: "assets/icons/google-icon.svg",
                      press: () {
                        AuthController.instance.signInWithGoogle();
                      },
                    ),
                    SocalCard(
                      icon: "assets/icons/facebook-2.svg",
                      press: () {},
                    ),
                    SocalCard(
                      icon: "assets/icons/twitter.svg",
                      press: () {},
                    ),
                  ],
                ),
                SizedBox(height: getProportionateScreenHeight(20)),
                NoAccountText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
