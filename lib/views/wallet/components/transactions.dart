import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartgas/controllers/fill_controller.dart';
import 'package:smartgas/controllers/location_controller.dart';
import 'package:smartgas/controllers/userController.dart';
import 'package:smartgas/models/fill.dart';
import 'package:smartgas/views/qr_scanner/controller/scan_controller.dart';
import 'package:smartgas/views/qr_scanner/data/scan_data.dart';
import 'package:smartgas/widgets/constants.dart';

class Transactions extends StatelessWidget {
  FillController fillController = Get.find();
  ScanController dx = Get.put(ScanController());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(() => SingleChildScrollView(
              padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
              child: Flexible(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: fillController.todos.length,
                  itemBuilder: (_, index) {
                    if (index == fillController.todos.length) {
                      return SizedBox.shrink();
                    }
                    fillController.refresh;
                    
                    return buildCard(UserController.instance.user.id,
                        fillController.todos[index], context);
                  },
                ),
              ),
            )),
        // Divider(
        //   color: Colors.greenAccent,
        //   thickness: 2,
        //   height: 1,
        // ),
        Obx(() => Container(
              padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),

              // width: 350,
              // height: 200,
              //child: Text('hello'),
              child: dx.scannedDataRx.value != null
                  ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: dx.scannedDataRx.value.length,
                      itemBuilder: (BuildContext context, int index) {


                        WidgetsBinding.instance?.addPostFrameCallback((_){
                            dx.addFill(FillModel(
                            quantity:
                                ((double.parse(dx.scannedDataRx.last.text)) /
                                        smartGasPrice) *
                                    20,
                            station: LocationController.instance.address.value,
                            date: Timestamp.now()));
                        dx.scannedDataRx.clear();
  // Your Code Here

});


                       

                        return SizedBox.shrink();
                      },
                    )
                  : Text("Smart Gas"),
            )),
      ],
    );
  }

  Widget buildCard(String? id, FillModel fill, BuildContext context) => Card(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 50.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    border: Border.all(
                      color: Colors.white,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(9.0),
                    ),
                    color: Colors.green[400],
                  ),
                  child: const Icon(
                    Icons.attach_money,
                    color: Colors.white,
                    size: 25,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      20.0, 0, MediaQuery.of(context).size.width * 0.2, 0),
                  child: Column(
                    children: [
                      Text(
                        'Gas refill',
                        style: TextStyle(
                          color: Colors.lightGreen[700],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${DateTime.fromMillisecondsSinceEpoch(fill.date.seconds * 1000).day}/${DateTime.fromMillisecondsSinceEpoch(fill.date.seconds * 1000).month}/${DateTime.fromMillisecondsSinceEpoch(fill.date.seconds * 1000).year}',
                        style: TextStyle(
                          fontSize: 10.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 20.0,
                  width: 100.0,
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    border: Border.all(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Text(
                    '-${(fill.quantity * smartGasPrice / 20).toStringAsFixed(2)} L.L.',
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15.0,
            ),
          ],
        ),
      );

  Widget buildQrscan(ScannedData scannedData) => Card(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 50.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    border: Border.all(
                      color: Colors.white,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(9.0),
                    ),
                    color: Colors.green[400],
                  ),
                  child: const Icon(
                    Icons.attach_money,
                    color: Colors.white,
                    size: 25,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 0, 100.0, 0),
                  child: Column(
                    children: [
                      Text(
                        'Gas refill',
                        style: TextStyle(
                          color: Colors.lightGreen[700],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        scannedData.time,
                        style: TextStyle(
                          fontSize: 10.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 20.0,
                  width: 100.0,
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    border: Border.all(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Text(
                    '-${(scannedData.text)} L.L.',
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15.0,
            ),
          ],
        ),
      );
}
//   Widget buildCard(String? id, FillModel fill) => Card(
//         child: Text('${fill.quantity * g95P / 20} L.L'),
//       );
// }
