import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:smartgas/controllers/carstats_controller.dart';
import 'package:smartgas/controllers/notification_controller.dart';
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
  NotificationController _notificationController = Get.find();
  //final navigationKey = GlobalKey<CurvedNavigationBarState>();
  void showNotification() {
    setState(() {});
    _notificationController.flutterLocalNotificationsPlugin.show(
        0,
        "Mingles",
        "How you doin ?",
        NotificationDetails(
            android: AndroidNotificationDetails(
                _notificationController.channel.id,
                _notificationController.channel.name,
                _notificationController.channel.description,
                importance: Importance.high,
                color: Colors.blue,
                playSound: true,
                icon: '@mipmap/ic_launcher')));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        _notificationController.flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                _notificationController.channel.id,
                _notificationController.channel.name,
                _notificationController.channel.description,
                color: Colors.greenAccent,
                playSound: true,
                icon: '@mipmap/ic_launcher',
              ),
            ));
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                title: Text(notification.title!),
                content: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text(notification.body!)],
                  ),
                ),
              );
            });
      }
    });
    showNotification();
  }

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
