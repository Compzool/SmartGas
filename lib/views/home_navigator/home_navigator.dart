import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartgas/controllers/carstats_controller.dart';
import 'package:smartgas/controllers/fill_controller.dart';
import 'package:smartgas/views/car_details/car_details.dart';
import 'package:smartgas/views/car_stats/car_data.dart';
import 'package:smartgas/views/car_stats/main.dart';
import 'package:smartgas/views/electric_car/electric_car.dart';
import 'package:smartgas/views/gas_station/gas_station_discover.dart';
import 'package:smartgas/views/profile/profile_page.dart';
import 'package:smartgas/views/wallet/wallet.dart';

import '../dashboard/dashboard_screen.dart';
import '../locations_screen/display_locations.dart';

class HomeNavigator extends StatefulWidget {
  const HomeNavigator({Key? key}) : super(key: key);

  @override
  State<HomeNavigator> createState() => _HomeNavigatorState();
}

class _HomeNavigatorState extends State<HomeNavigator> {
  int _page = 2;
  //final navigationKey = GlobalKey<CurvedNavigationBarState>();
  @override
  Widget build(BuildContext context) {
    final items = [
      Icon(CupertinoIcons.car_detailed, size: 30),
      Icon(Icons.account_balance_wallet, size: 30),
      Icon(Icons.dashboard, size: 30),
      Icon(CupertinoIcons.location_fill, size: 30),
      Icon(Icons.person, size: 30),
    ];
    var carStatsCont = Get.put(CarStatsCont());
    var fillController = Get.put(FillController());

    // final screens = [
    //   screen1,
    //   Wallet(),
    //   Dashboard(),
    //   DisplayLocations(),
    //   ProfilePage(),
    // ];
    // final screens = RxList([
    //   screen1,
    //   Wallet(),
    //   Dashboard(),
    //   DisplayLocations(),
    //   ProfilePage(),
    // ]);

    return Scaffold(
      // body: Container(
      //   height: double.maxFinite,
      //   width: double.maxFinite,
      //   decoration: const BoxDecoration(
      //     color: Colors.white,
      //     // image: DecorationImage(
      //     //   image: AssetImage('assets/images/eco11.jpg'),
      //     //   fit: BoxFit.cover,
      //     //   opacity: 0.6,
      //     // ),
      //   ),
      //   child: Body(),
      // ),
      extendBody: true,
      resizeToAvoidBottomInset: true,
      //body: screens[_page],
      body: carStatsCont.screens.value[_page],
      bottomNavigationBar: CurvedNavigationBar(
        items: items,
        index: _page,
        //color: Color(0x332F2F2F),
        color: Color.fromARGB(200, 131, 131, 131),
        backgroundColor: Colors.transparent,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 500),
        onTap: (index) => setState(() => _page = index),
      ),
    );
  }
}
