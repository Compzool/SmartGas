import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartgas/controllers/authentication_controller.dart';
import 'package:smartgas/controllers/information.dart';
import 'package:smartgas/controllers/signup_controller.dart';
import 'package:smartgas/controllers/userController.dart';
import 'package:smartgas/models/user.dart';
import 'package:smartgas/services/database.dart';

import '../edit_profile.dart';

class Profile extends GetView<AuthController> {
  Profile({Key? key}) : super(key: key);
  signUpController signupController = Get.find();
  UserController userController = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    return Row(
      //mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        FutureBuilder<SmartUser?>(
            future: controller.isGoolgeSignIn == false
                ? Database().readSingleUser(controller.userCurrent!.uid)
                : Database().readSingleUser(controller.userModelCurrent!.id!),
            // future: Database().readSingleUser(controller.userCurrent!.uid),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return snapshot.hasData
                      ? buildClient(snapshot.data!, context)
                      : Center(child: CircularProgressIndicator());
                case ConnectionState.done:
                default:
                  if (snapshot.hasData) {
                    final user = snapshot.data!;
                    return user == null
                        ? Center(
                            child: Text("No User Found"),
                          )
                        : buildClient(user, context);
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
              }
            }),
      ],
    );
  }
}

Widget buildUser(SmartUser user) => ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(user.pictureUrl!),
      ),
      title: Text(user.fullName!),
      subtitle: Text(user.email!),
    );

Widget buildClient(SmartUser user, context) => Expanded(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(20, 20, 0, 20),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.25,
            height: 90,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Image(
              image: NetworkImage(user.pictureUrl!),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                user.fullName!,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                user.email!,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => EditProfile()));
          },
          icon: const Icon(
            Icons.edit,
            size: 20,
          ),
        )
      ],
    ));
