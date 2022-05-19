import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smartgas/controllers/controller_constants.dart';
import 'package:smartgas/controllers/information.dart';
import 'package:smartgas/controllers/signup_controller.dart';
import 'package:smartgas/controllers/userController.dart';
import 'package:smartgas/models/user.dart';
import 'package:smartgas/services/database.dart';
import 'package:smartgas/widgets/profile_picture.dart';

class EditProfile extends StatefulWidget {
  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  late TextEditingController birthdayController;
  late TextEditingController emailController;
  late TextEditingController usernameController;
  late TextEditingController passwordController;
  final _formKey = GlobalKey<FormState>();
  late bool passwordVisibility;

  @override
  void initState() {
    super.initState();
    emailController =
        TextEditingController(text: UserController.instance.user.email);
    usernameController =
        TextEditingController(text: UserController.instance.user.fullName);
    passwordController =
        TextEditingController(text: UserInformation.instance.password.value);
    birthdayController =
        TextEditingController(text: UserController.instance.user.birthday);
    passwordVisibility = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(-1, 0),
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios_sharp,
                          color: Colors.black,
                          size: 15,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(90, 0, 0, 0),
                      child: Text(
                        'Edit Profile',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  child: ProfilePicture(),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Align(
                      alignment: AlignmentDirectional(-0.85, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                        child: Text(
                          'Email Address',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                      child: TextFormField(
                        onSaved: ((newValue) {
                          emailController.text = newValue!.trim();
                        }),
                        controller: emailController,
                        obscureText: false,
                        decoration: InputDecoration(
                          //hintText: 'Example@email.com',
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFF26A756),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFF26A756),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                            ),
                          ),
                        ),
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-0.85, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                        child: Text(
                          'Username',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                      child: TextFormField(
                        controller: usernameController,
                        onSaved: ((newValue) {
                          usernameController.text = newValue!;
                        }),
                        obscureText: false,
                        decoration: InputDecoration(
                          //hintText: '@ElonMusk',
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFF26A756),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFF26A756),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                            ),
                          ),
                        ),
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                        keyboardType: TextInputType.name,
                      ),
                    ),
                    const Align(
                      alignment: AlignmentDirectional(-0.85, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                        child: Text(
                          'Password',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                      child: TextFormField(
                        controller: passwordController,
                        onSaved: ((newValue) {
                          passwordController.text = newValue!.trim();
                          // updateProfile.update({'password':passwordController.text});
                        }),
                        obscureText: !passwordVisibility,
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFF26A756),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                            ),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFF26A756),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                            ),
                          ),
                          suffixIcon: InkWell(
                            onTap: () => setState(
                              () => passwordVisibility = !passwordVisibility,
                            ),
                            child: Icon(
                              passwordVisibility
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              color: Color(0xFF26A756),
                              size: 22,
                            ),
                          ),
                        ),
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                        keyboardType: TextInputType.visiblePassword,
                      ),
                    ),
                    const Align(
                      alignment: AlignmentDirectional(-0.85, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                        child: Text(
                          'Birth Date',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                      child: TextFormField(
                        controller: birthdayController,
                        onSaved: ((newValue) {
                          birthdayController.text = newValue!;
                        }),
                        obscureText: false,
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFF26A756),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFF26A756),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                            ),
                          ),
                        ),
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                        keyboardType: TextInputType.datetime,
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0.75, -0.05),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                updateProfile();
                              }
                            });
                          },
                          child: const Icon(
                            Icons.done,
                            color: Colors.white,
                            size: 30,
                          ),
                          style: ButtonStyle(
                            shape:
                                MaterialStateProperty.all(const CircleBorder()),
                            fixedSize:
                                MaterialStateProperty.all(const Size(60, 60)),
                            backgroundColor: MaterialStateProperty.all(
                                const Color(0xFF26A756)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void updateProfile() async {
    final updateProfile = FirebaseFirestore.instance
        .collection('users')
        .doc(UserController.instance.user.id);
    updateProfile.update({'name': usernameController.text});
    updateProfile.update({'email': emailController.text});
    updateProfile.update({'birthday': birthdayController.text});
    _changePassword(passwordController.text);
    Get.find<UserController>().user = await Database()
        .readSingleUser(UserController.instance.user.id!) as SmartUser;
    UserController.instance.refresh();
  }

  void _changePassword(String password) async {
    //Create an instance of the current user.

    //Pass in the password to updatePassword.
    auth.currentUser?.updatePassword(password).then((_) {
      print("Successfully changed password");
    }).catchError((error) {
      print("Password can't be changed" + error.toString());
      //This might happen, when the wrong password is in, the user isn't found, or if the user hasn't logged in recently.
    });
  }
}
