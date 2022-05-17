import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:smartgas/views/qr_scanner/data/scan_data.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ScanController extends GetxController {
  var controller;
  var barcodeResult;
  var flashIcon = Icons.flash_off.obs;

  Rx<int> barcodefound = 0.obs;

  var camPermission = true.obs;
  var scannedDataRx = [].obs;
  void add(ScannedData data) {
    scannedDataRx.add(data);
  }
  
  void updateContoller(QRViewController cont) {
    controller = cont.obs;
    controller.value.scannedDataStream.listen((scanData) {
      if (scannedData
                  .indexWhere((element) => element.text == scanData.code) ==
              -1 ||
          scannedData.length == 0) {
        scannedData.add(ScannedData(
            text: scanData.code,
            time: DateTime.now().toString().split(" ")[1].substring(0, 8)));
        scannedDataRx.add(ScannedData(
            text: scanData.code,
            time: DateTime.now().toString().split(" ")[1].substring(0, 8)));
      }
      barcodeResult = scanData;
      barcodefound(barcodefound.value + 1);
      launchURL(scanData.code);
    });
  }

  void launchURL(String scanData) async {
    if (await canLaunchUrlString(scanData)) {
      await launchUrlString(scanData);
      throw 'Could not launch $barcodeResult';
    }
  }

  @override
  void dispose() {
    super.dispose();
    controller?.dispose();
  }
}
