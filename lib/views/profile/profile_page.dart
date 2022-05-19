import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../fills/fills.dart';
import 'components/dashboard.dart';
import 'components/my_account.dart';
import 'components/my_car.dart';
import 'components/profile.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        height: double.maxFinite,
        decoration: BoxDecoration(
          // color: Colors.white,

          gradient: LinearGradient(
            colors: [
              Color.fromARGB(50, 255, 235, 59),
              Color.fromARGB(50, 244, 67, 54),
              Color.fromARGB(50, 63, 81, 181),
              Color.fromARGB(50, 0, 150, 135),
            ],
            stops: [
              0.1,
              0.4,
              0.6,
              0.9,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Row(
            //   mainAxisSize: MainAxisSize.max,
            //   children: [
            //     Align(
            //       alignment: const AlignmentDirectional(-1, 0),
            //       child: IconButton(
            //         onPressed: () {},
            //         icon: const Icon(
            //           Icons.arrow_back_ios_sharp,
            //           color: Colors.black,
            //           size: 15,
            //         ),
            //       ),
            //     ),
            //     const Padding(
            //       padding: EdgeInsetsDirectional.fromSTEB(90, 0, 0, 0),
            //       child: Text(
            //         'My Profile',
            //         style: TextStyle(
            //           fontWeight: FontWeight.bold,
            //           fontSize: 20,
            //         ),
            //       ),
            //     ),
            //     Padding(
            //       padding: const EdgeInsetsDirectional.fromSTEB(90, 0, 0, 0),
            //       child: IconButton(
            //         onPressed: () {},
            //         icon: const Icon(
            //           Icons.more_vert,
            //           color: Colors.black,
            //           size: 20,
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            Profile(),
            const Padding(
              padding: EdgeInsetsDirectional.fromSTEB(30, 30, 0, 5),
              child: Text(
                'My Car',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            MyCar(),
            Container(
              padding: EdgeInsetsDirectional.fromSTEB(
                  MediaQuery.of(context).size.width * 0.085,
                  0,
                  MediaQuery.of(context).size.width * 0.085,
                  0),
              child: ElevatedButton(
                  onPressed: () => Get.to(() => ShowFills()),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  child: Text("Fills")),
            ),
            const Padding(
              padding: EdgeInsetsDirectional.fromSTEB(30, 30, 0, 5),
              child: Text(
                'Dashboard',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Dashboard(),
            MyAccount(),
          ],
        ),
      ),
    );
  }
}
