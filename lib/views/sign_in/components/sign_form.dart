import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartgas/colors/colors.dart';
import 'package:smartgas/components/custom_surfix_icon.dart';
import 'package:smartgas/components/form_error.dart';
import 'package:smartgas/controllers/authentication_controller.dart';
import 'package:smartgas/controllers/information.dart';
import 'package:smartgas/helper/keyboard.dart';
import 'package:smartgas/views/forgot_password/forgot_password_screen.dart';
import 'package:smartgas/views/login_success/login_success_screen.dart';
//import 'package:smartgas/views/login_success/login_success_screen.dart';
import '../../../components/default_button.dart';
import 'package:smartgas/widgets/constants.dart';
import 'package:smartgas/widgets/size_config.dart';

class SignForm extends StatefulWidget {
  final rememberKey = GlobalKey<_SignFormState>();
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  //AuthController authController = Get.put(AuthController());
  final _formKey = GlobalKey<FormState>();
  late SharedPreferences preferences;
  String? email;
  String? password;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool? remember = false;
  final List<String?> errors = [];

  void addError({String? error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String? error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  void initState() {
    super.initState();
    init().then((value) => setState(() {
          remember = preferences.getBool('remember_me')!;
          email = preferences.getString("email");
          password = preferences.getString("password");
          email != null ? emailController.text = email! : "Email";
          password != null ? passwordController.text = password! : "Password";
          print(remember);
          print(email);
          print(password);
        }));
  }

  Future init() async {
    preferences = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          Row(
            children: [
              Checkbox(
                value: remember, //preferences.getBool('remember'),
                activeColor: AppColors.color1,
                onChanged: (value) async {
                  await preferences.setBool('remember_me', value!);

                  bool? signInStatus = preferences.getBool('remember_me')!;
                  //AuthController.instance.signInStatus.write('remeber', value);
                  print(signInStatus);
                  setState(() {
                    remember = signInStatus;
                    //UserInformation.instance.remembered = value!;
                  });
                },
              ),
              Text("Remember me"),
              Spacer(),
              GestureDetector(
                onTap: () => Get.to(() => ForgotPasswordScreen()),
                child: Text(
                  "Forgot Password",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
            text: "Continue",
            press: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                // if all are valid then go to success screen
                if (remember == true) {
                  preferences.setString('email', email!);
                  preferences.setString('password', password!);
                } else {
                  preferences.clear();
                }
                KeyboardUtil.hideKeyboard(context);
                // Get.to(()=>LoginSuccessScreen());
                AuthController.instance.login(email!, password!);
                UserInformation.instance.password.value = password!;
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      controller: passwordController,
      //initialValue: passwordController.text,
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 6) {
          removeError(error: kShortPassError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 6) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      controller: emailController,
      // initialValue: emailController.text,
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }
}
