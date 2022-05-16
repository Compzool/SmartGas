import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartgas/controllers/fill_controller.dart';
import 'package:smartgas/views/dashboard/components/body.dart';

class NextBody extends GetView<FillController> {
  const NextBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) {
        return Center(
          child: Body(),
        );
      },
      onLoading: Center(child: CircularProgressIndicator()),
    );
  }
}
