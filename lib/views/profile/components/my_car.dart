import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartgas/views/add_car/add_car.dart';
import 'package:smartgas/views/show_cars/show_vehicles.dart';

class MyCar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(30, 10, 10, 0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
              width: MediaQuery.of(context).size.width * 0.6,
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  Get.to(ShowVehicles());
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                child: const Text('Check Cars'),
              ),
            ),
            // Container(
            //   padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
            //   width: 80,
            //   height: 40,
            //   child: ElevatedButton(
            //     onPressed: () {},
            //     style: ButtonStyle(
            //       backgroundColor: MaterialStateProperty.all(Colors.amber),
            //       shape: MaterialStateProperty.all(
            //         RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(20),
            //         ),
            //       ),
            //     ),
            //     child: const Text('Toyota'),
            //   ),
            // ),
            // Container(
            //   padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
            //   width: 80,
            //   height: 40,
            //   child: ElevatedButton(
            //     onPressed: () {},
            //     style: ButtonStyle(
            //       backgroundColor: MaterialStateProperty.all(Colors.green),
            //       shape: MaterialStateProperty.all(
            //         RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(20),
            //         ),
            //       ),
            //     ),
            //     child: const Text('Honda'),
            //   ),
            // ),
            Container(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
              width: 80,
              height: 40,
              child: ElevatedButton(
                onPressed: () => Get.to(
                  () => NewVehicle(),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                child: const Text(
                  '+',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
