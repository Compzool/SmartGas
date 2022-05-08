import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smartgas/controllers/signup_controller.dart';
import 'package:smartgas/widgets/constants.dart';
import 'package:smartgas/widgets/size_config.dart';

import 'complete_profile_form.dart';

class Body extends GetView<signUpController>{
  File? pickedFile;
  ImagePicker imagePicker = ImagePicker();
  signUpController controller = Get.put(signUpController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.03),
                Center(
                  child: Stack(
                    children: [
                      Obx(()=>
                      Container(
                        width: 130,
                        height: 130,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 4,
                                color:
                                    Theme.of(context).scaffoldBackgroundColor),
                            boxShadow: [
                              BoxShadow(
                                  spreadRadius: 2,
                                  blurRadius: 10,
                                  color: Colors.black.withOpacity(0.1),
                                  offset: Offset(0, 10))
                            ],
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image:
                                    controller.isProfilePicPathSet.value == true? FileImage(File(controller.profilePath.value)) as ImageProvider : AssetImage('assets/images/profile.jpg'))),
                      )),
                      Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 4,
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                              ),
                              color: Colors.green,
                            ),
                            child: InkWell(
                              onTap: () {
                                print("Camera");
                                showModalBottomSheet(
                                    context: context,
                                    builder: (context) => buttomSheet(context));
                              },
                              child: Icon(
                                Icons.camera_alt,
                                color: Colors.white,
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.06),
                CompleteProfileForm(),
                SizedBox(height: getProportionateScreenHeight(30)),
                Text(
                  "By continuing your confirm that you agree \nwith our Term and Condition",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.caption,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buttomSheet(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.3,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: size.height * 0.1,
            child: Center(
              child: Text(
                "Choose Profile Picture",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ),
          ),
          SizedBox(height: size.height * 0.01),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(children: [
                IconButton(
                    onPressed: () {
                      takeImage(ImageSource.camera);
                    },
                    icon: Icon(
                      Icons.camera_enhance_rounded,
                      size: 35,
                      color: Colors.green,
                    )),
                SizedBox(
                  height: 5,
                ),
                Text("Camera",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    )),
              ]),
              Column(children: [
                IconButton(
                    onPressed: () {
                      takeImage(ImageSource.gallery);
                    },
                    icon: Icon(
                      Icons.image,
                      color: Colors.green,
                      size: 35,
                    )),
                SizedBox(
                  height: 5,
                ),
                Text("Gallery",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    )),
              ])
            ],
          )
        ],
      ),
    );
  }

  Future<void> takeImage(ImageSource imageSource) async {
    final pickedImage =
        await imagePicker.pickImage(source: imageSource, imageQuality: 100);

    pickedFile = File(pickedImage!.path);
    controller.setProfileImagePath(pickedFile!.path);
    Get.back();
  }
}
