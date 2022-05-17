import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartgas/controllers/fill_controller.dart';
import 'package:smartgas/controllers/userController.dart';
import 'package:smartgas/models/fill.dart';
import 'package:smartgas/views/qr_scanner/controller/scan_controller.dart';
import 'package:smartgas/views/qr_scanner/data/scan_data.dart';

class Transactions extends StatelessWidget {
  double g95P = 441000;
  FillController fillController = Get.find();
  ScanController dx = Get.put(ScanController());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
          child: Flexible(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: fillController.todos.length,
              itemBuilder: (_, index) {
                return buildCard(UserController.instance.user.id,
                    fillController.todos[index]);
              },
            ),
          ),
        ),
        
        Obx(() => SingleChildScrollView(
              padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),

              // width: 350,
              // height: 200,
              //child: Text('hello'),
              child: dx.scannedDataRx.value != null
                  ? Flexible(
                      child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: dx.scannedDataRx.value.length,
                      itemBuilder: (BuildContext context, int index) {
                        return buildQrscan(dx.scannedDataRx.value[index]);
                      },
                    ))
                  : null,
            )),
      ],
    );
  }

  Widget buildCard(String? id, FillModel fill) => Card(
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
                    '-${(fill.quantity * g95P / 20).toStringAsFixed(2)} L.L.',
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
