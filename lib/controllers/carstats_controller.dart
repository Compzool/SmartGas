import 'package:get/get.dart';
import 'package:smartgas/views/car_stats/main.dart';

import '../views/dashboard/dashboard_screen.dart';
import '../views/locations_screen/display_locations.dart';
import '../views/profile/profile_page.dart';
import '../views/wallet/wallet.dart';

class CarStatsCont extends GetxController {
  RxBool isElectric = false.obs;
  RxBool isStats = true.obs;
  RxList screens = RxList([
    CarStats(),
    Wallet(),
    Dashboard(),
    DisplayLocations(),
    ProfilePage(),
  ]);
}
