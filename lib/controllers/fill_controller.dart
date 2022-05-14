import 'package:get/get.dart';
import 'package:smartgas/controllers/userController.dart';
import 'package:smartgas/models/fill.dart';
import 'package:smartgas/services/database.dart';

class FillController extends GetxController {
  static FillController instance = Get.find();
  // Rx<CarModel> _carModel = CarModel(car: "",model: "",driversLicense: "",licensePlate: "").obs;

  // CarModel get car => _carModel.value;

  // set car(CarModel value) => this._carModel.value = value;

  // void clear(){
  //   _carModel.value = CarModel(car: "",model: "",driversLicense: "",licensePlate: "");
  // }
  Rx<List<FillModel>> fillList = Rx<List<FillModel>>([]);

  List<FillModel> get todos => fillList.value;

  @override
  void onInit() {
    String uid = UserController.instance.user.id!;
    // TODO: implement onInit
    fillList.bindStream(Database().readFillStream(uid));
    super.onInit();
  }
}
