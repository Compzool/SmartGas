import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:hexcolor/hexcolor.dart';
import 'package:smartgas/views/gas_station/gas_station_discover.dart';
import 'package:smartgas/views/locations_screen/components/locations_widget.dart';

class DisplayLocations extends StatefulWidget {
  const DisplayLocations({Key? key}) : super(key: key);

  @override
  State<DisplayLocations> createState() => _DisplayLocationsState();
}

class _DisplayLocationsState extends State<DisplayLocations> {
  int currentIndex = 0;
  final Screens = [LocationsWidget(), DiscoverStation()];
  @override
  Widget build(BuildContext context) => Scaffold(
        //backgroundColor: Colors.greenAccent,
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(100), child: buildAppBar()),
        // body: Container(
        //     height: double.infinity,
        //     width: double.infinity,
        //     decoration: const BoxDecoration(
        //       image: DecorationImage(
        //           image: AssetImage("assets/images/Lebanon.jpg"),
        //           fit: BoxFit.cover),
        //     ),
        //     child: LocationsWidget()),
        body: Stack(children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              "assets/images/Lebanon.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Screens[currentIndex],
        ]),
        bottomNavigationBar: buildBottomNavigation(),
      );

  Widget buildAppBar() => AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text('Nearby Stations'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.location_pin),
            onPressed: () {},
          ),
        ],
        leading: IconButton(
          icon: Icon(Icons.search_outlined),
          onPressed: () {},
        ),
      );

  Widget buildBottomNavigation() => BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => setState(() {
          currentIndex = index;
        }),
        elevation: 0,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.greenAccent,
        backgroundColor: HexColor("#f9e8d8"),
        showSelectedLabels: true,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.pin_drop_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: '',
          ),
        ],
      );
}
