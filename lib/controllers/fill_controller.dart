import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:smartgas/controllers/userController.dart';
import 'package:smartgas/models/fill.dart';
import 'package:smartgas/services/database.dart';
import 'package:smartgas/views/dashboard/components/body.dart';

class FillController extends GetxController with StateMixin {
  static FillController instance = Get.find();
  // Rx<CarModel> _carModel = CarModel(car: "",model: "",driversLicense: "",licensePlate: "").obs;

  // CarModel get car => _carModel.value;

  // set car(CarModel value) => this._carModel.value = value;

  // void clear(){
  //   _carModel.value = CarModel(car: "",model: "",driversLicense: "",licensePlate: "");
  // }
  Rx<List<FillModel>> fillList = Rx<List<FillModel>>([]);
  List<FillModel> get todos => fillList.value.isNotEmpty
      ? fillList.value
      : [FillModel(quantity: 0, station: "no station", date: Timestamp.now())];

  List<SalesData> get salesData => getSalesData();

  @override
  Future<void> onInit() async {
    String uid = UserController.instance.user.id!;
    // TODO: implement onInit
    fillList.bindStream(Database().readFillStream(uid));
    change(null, status: RxStatus.loading());
    await Future.delayed(Duration(seconds: 3));
    change(null, status: RxStatus.success());
    super.onInit();
  }

  double weeklyFills() {
    double weekly = 0;
    if (todos.length == 0) {
      return weekly;
    }
    for (int i = 0; i < todos.length; i++) {
      if (DateTime.fromMillisecondsSinceEpoch(todos[i].date.seconds * 1000)
          .isAfter(DateTime.now().subtract(Duration(days: 7)))) {
        weekly += todos[i].quantity;
      }
    }
    return weekly;
  }

  List<SalesData> getSalesData() {
    todos.sort((a, b) => a.date.seconds.compareTo(b.date.seconds));
    List<SalesData> salesData = [];
    if (todos.length == 0) {
      salesData.add(SalesData("0", 0));
      return salesData;
    }
    for (int i = 0; i < todos.length; i++) {
      salesData.add(SalesData(
          "${DateTime.fromMillisecondsSinceEpoch(todos[i].date.seconds * 1000).day.toString()}/${DateTime.fromMillisecondsSinceEpoch(todos[i].date.seconds * 1000).month.toString()}",
          todos[i].quantity));
    }
    return salesData;
  }
}
