import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:smartgas/components/custom_surfix_icon.dart';
import 'package:smartgas/components/default_button.dart';
import 'package:smartgas/components/form_error.dart';
import 'package:smartgas/controllers/authentication_controller.dart';
import 'package:smartgas/controllers/information.dart';
import 'package:smartgas/controllers/location_controller.dart';
import 'package:smartgas/views/otp/otp_screen.dart';
import 'package:smartgas/views/sign_up/components/sign_up_form.dart';

import 'package:smartgas/widgets/constants.dart';
import 'package:smartgas/widgets/size_config.dart';

class CompleteProfileForm extends StatefulWidget {
  @override
  _CompleteProfileFormState createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  final _formKey = GlobalKey<FormState>();
  //LocationController locationController = Get.put(LocationController());
  SignUpForm testing = SignUpForm();
  final dateController = TextEditingController();
  LocationController locationController = Get.find();
  UserInformation userInformation = Get.find();
  final List<String?> errors = [];
  String? fullName;
  String? license;
  String? phoneNumber;
  String? address;
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
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildFullNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildLicenseFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPhoneNumberFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildAgeFormField(dateController),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildAddressFormField(),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
            text: "continue",
            press: () {
              if (_formKey.currentState!.validate()) {
                print(locationController.address.value.toString());
                AuthController.instance.register(
                  userInformation.email.value,
                  userInformation.password.value,
                  fullName!,
                  phoneNumber!,
                  locationController.address.value,
                  userInformation.filePath.value,
                  license!,
                  dateController.text,
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Obx buildAddressFormField() {
    // return TextFormField(
    //   onSaved: (newValue) => address = newValue,
    //   onChanged: (value) {
    //     if (value.isNotEmpty) {
    //       removeError(error: kAddressNullError);
    //     }
    //     return null;
    //   },
    //   validator: (value) {
    //     if (value!.isEmpty) {
    //       addError(error: kAddressNullError);
    //       return "";
    //     }
    //     return null;
    //   },
    //   decoration: InputDecoration(
    //     labelText: "Address",
    //     hintText: "Enter your phone address",
    //     // If  you are using latest version of flutter then lable text and hint text shown like this
    //     // if you r using flutter less then 1.20.* then maybe this is not working properly
    //     floatingLabelBehavior: FloatingLabelBehavior.always,
    //     suffixIcon:
    //         CustomSurffixIcon(svgIcon: "assets/icons/Location point.svg"),
    //   ),
    // );
    return Obx(
      () => Text(
        "Address: ${locationController.address.value}",
        style:
            TextStyle(color: Color.fromARGB(255, 128, 219, 25), fontSize: 25),
      ),
    );
  }

  TextFormField buildPhoneNumberFormField() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      onSaved: (newValue) {
        phoneNumber = newValue;
        print(phoneNumber);
      },
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPhoneNumberNullError);
        }
        phoneNumber = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPhoneNumberNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Phone Number",
        hintText: "Enter your phone number",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Phone.svg"),
      ),
    );
  }

  TextFormField buildLicenseFormField() {
    return TextFormField(
      onSaved: (newValue) {
        license = newValue;
        print(license);
      },
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kLicenseNullError);
        } else if (licenseValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidLicenseError);
        }
        license = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kLicenseNullError);
          return "";
        } else if (!licenseValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidLicenseError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Social Security Number",
        hintText: "Enter social security number",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/id-card.svg"),
      ),
    );
  }

  TextFormField buildFullNameFormField() {
    return TextFormField(
      onSaved: (newValue) {
        fullName = newValue;
        print(fullName);
      },
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kNamelNullError);
        }
        fullName = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kNamelNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Full Name",
        hintText: "Enter your full name",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

  Widget buildAgeFormField(TextEditingController dateController) {
    return DateTimeField(
      decoration: InputDecoration(
        hintText: "Date Of Birth",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon:
            CustomSurffixIcon(svgIcon: "assets/icons/date-of-birth.svg"),
      ),
      controller: dateController,
      format: DateFormat("yyyy-MM-dd"),
      onShowPicker: (context, currentValue) {
        return showDatePicker(
          context: context,
          firstDate: DateTime(1900),
          initialDate: currentValue ?? DateTime.now(),
          lastDate: DateTime(2100),
        );
      },
    );
  }
}
