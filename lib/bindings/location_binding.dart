import 'package:get/get.dart';
import 'package:smartgas/controllers/information.dart';
import 'package:smartgas/controllers/notification_controller.dart';
import 'package:smartgas/controllers/signup_controller.dart';
import 'package:smartgas/controllers/userController.dart';

import '../controllers/location_controller.dart';

class AllControllerBinding implements Bindings {
  @override
  void dependencies() {
  Get.put<LocationController>(
      LocationController(),
    );
  }
}
