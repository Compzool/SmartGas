import 'package:get/get.dart';
import 'package:smartgas/models/user.dart';

class UserController extends GetxController{
  Rx<SmartUser> _smartUser = SmartUser().obs;
  
  SmartUser get user => _smartUser.value;

  set user(SmartUser value) => this._smartUser.value = value;

  void clear(){
    _smartUser.value = SmartUser();
  }
}