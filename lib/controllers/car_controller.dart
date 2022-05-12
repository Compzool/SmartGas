import 'package:get/get.dart';
import 'package:smartgas/controllers/authentication_controller.dart';
import 'package:smartgas/controllers/userController.dart';
import 'package:smartgas/models/cars.dart';
import 'package:smartgas/models/user.dart';
import 'package:smartgas/services/database.dart';

class CarController extends GetxController{
  static CarController instance = Get.find();
  // Rx<CarModel> _carModel = CarModel(car: "",model: "",driversLicense: "",licensePlate: "").obs;
  
  // CarModel get car => _carModel.value;

  // set car(CarModel value) => this._carModel.value = value;

  // void clear(){
  //   _carModel.value = CarModel(car: "",model: "",driversLicense: "",licensePlate: "");
  // }
  Rx<List<CarModel>> carList = Rx<List<CarModel>>([]);

List<CarModel> get todos => carList.value;

@override
void onInit() {
  String uid = UserController.instance.user.id!;
    // TODO: implement onInit
    carList.bindStream(Database().readInfoStream(uid));
    super.onInit();
  }
}