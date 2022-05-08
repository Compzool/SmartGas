import 'package:get/get.dart';

class signUpController extends GetxController {
  var isProfilePicPathSet = false.obs;
  var profilePath = ''.obs;
  void setProfileImagePath(String path) {
    profilePath.value = path;
    isProfilePicPathSet.value = true;
  }
}
