import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartgas/views/qr_scanner/pages/home.dart';
import 'package:smartgas/views/qr_scanner/controller/animate.dart';

class QrScanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QR code Scanner',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
