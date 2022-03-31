import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:smartgas/views/gas_station/gas_station_discover.dart';
import 'package:smartgas/views/wallet/wallet.dart';

import '../dashboard/dashboard_screen.dart';

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
      Icon(Icons.home, size: 30),
      Icon(Icons.account_balance_wallet, size: 30),
      Icon(Icons.dashboard, size: 30),
      Icon(Icons.notifications, size: 30),
      Icon(Icons.person, size: 30),
    ];
    final screens = [
      Dashboard(),
      Wallet(),
      Dashboard(),
      DiscoverStation(),
      Dashboard(),
    ];
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
      body: screens[_page],
      bottomNavigationBar: CurvedNavigationBar(
        items: items,
        index: _page,
        color: Color(0x332F2F2F),
        backgroundColor: Colors.transparent,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) => setState(() => _page = index),
      ),
    );
  }
}
