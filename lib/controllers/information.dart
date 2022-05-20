import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserInformation extends GetxController {
  static UserInformation instance = Get.find();
  final email = "".obs;
  final password = "".obs;
  final location = "".obs;
  final filePath = "".obs;
  final pictureURL = "".obs;
  final adminFuelPrice98 = "441000".obs;
  final adminFuelPrice95 = "431000".obs;
  final money = 0.0.obs;
  final userBalance = 10000000.0.obs;
  void payment() {
    if ((userBalance.value - money.value) > 0) {
      userBalance.value -= money.value;
    }
    money.value = 0.0;
  }
  //late SharedPreferences prefs;
  // final rememberMe = GetStorage();

  // void setRemember(bool value) {
  //   rememberMe.write('isRemembered', value);

  // }

  // bool? getRemember() {
  //   print(rememberMe.read('isRemembered'));
  //   return rememberMe.read('isRemembered');
  // }
}
