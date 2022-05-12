import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smartgas/controllers/information.dart';
import 'package:smartgas/controllers/signup_controller.dart';
import 'package:smartgas/controllers/userController.dart';

class ProfilePicture extends StatelessWidget {
  ProfilePicture({Key? key}) : super(key: key);
  File? pickedFile;
  ImagePicker imagePicker = ImagePicker();
  signUpController signupController = Get.put(signUpController());
  UploadTask? uploadTask;
  String? uploadedFileURL;
  UserInformation userInformation = Get.find();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Obx(() => Container(
                width: 130,
                height: 130,
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 4,
                        color: Theme.of(context).scaffoldBackgroundColor),
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
                        image: signupController.isProfilePicPathSet.value ==
                                true
                            ? FileImage(
                                    File(signupController.profilePath.value))
                                as ImageProvider
                            : choosePicture()!)),
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
                    color: Theme.of(context).scaffoldBackgroundColor,
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

  ImageProvider? choosePicture() {
    if (UserController.instance.user.pictureUrl != null) {
      return NetworkImage(UserController.instance.user.pictureUrl!);
    } else {
      return NetworkImage('assets/images/download.jpg');
    }
  }

  Future<void> takeImage(ImageSource imageSource) async {
    final pickedImage =
        await imagePicker.pickImage(source: imageSource, imageQuality: 100);
    final updateImage = FirebaseFirestore.instance.collection('users').doc(UserController.instance.user.id);
    final dir = 'files/${pickedImage!.name}';

    pickedFile = File(pickedImage.path);
    signupController.setProfileImagePath(pickedFile!.path);
    final ref = FirebaseStorage.instance.ref().child(dir);
    uploadTask = ref.putFile(pickedFile!);
    final snapshot = await uploadTask!.whenComplete(() {});

    uploadedFileURL = await snapshot.ref.getDownloadURL();
    userInformation.filePath.value = uploadedFileURL.toString();
    updateImage.update({'pictureUrl': uploadedFileURL});
    print(uploadedFileURL);
    Get.back();
  }
}
