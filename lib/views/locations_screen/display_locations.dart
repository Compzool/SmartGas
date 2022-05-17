import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:hexcolor/hexcolor.dart';
import 'package:smartgas/services/station_scraping.dart';
import 'package:smartgas/views/gas_station/gas_station_discover.dart';
import 'package:smartgas/views/locations_screen/components/locations_widget.dart';

import '../../services/locations.dart';

class DisplayLocations extends StatefulWidget {
  const DisplayLocations({Key? key}) : super(key: key);

  @override
  State<DisplayLocations> createState() => _DisplayLocationsState();
}

class _DisplayLocationsState extends State<DisplayLocations> {
  int currentIndex = 0;
  final Screens = [LocationsWidget(), DiscoverStation()];
  // final Screens = [
  //   DiscoverStation(),
  //   LocationsWidget(),
  // ];
  @override
  Widget build(BuildContext context) => Scaffold(
        //backgroundColor: Colors.greenAccent,
        extendBodyBehindAppBar: true,
        extendBody: true,
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(100), child: buildAppBar()),
        //body: SafeArea(child: Text('Test')),
        // body: Container(
        //     height: double.infinity,
        //     width: double.infinity,
        //     decoration: const BoxDecoration(
        //       image: DecorationImage(
        //           image: AssetImage("assets/images/Lebanon.jpg"),
        //           fit: BoxFit.cover),
        //     ),
        //     child: LocationsWidget()),
        // body: Stack(
        //   children: [
        //     SizedBox(
        //       width: double.infinity,
        //       height: double.infinity,
        //       child: Image.asset(
        //         "assets/images/Lebanon.jpg",
        //         fit: BoxFit.cover,
        //       ),
        //     ),
        //     Screens[currentIndex],
        //   ],
        // ),
        body: Container(
          decoration: const BoxDecoration(
            // color: Colors.white,

            gradient: LinearGradient(
              colors: [
                Color.fromARGB(70, 255, 235, 59),
                Color.fromARGB(70, 244, 67, 54),
                Color.fromARGB(70, 63, 81, 181),
                Color.fromARGB(70, 0, 150, 135),
              ],
              stops: [
                0.1,
                0.4,
                0.6,
                0.9,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Screens[currentIndex],
        ),
        bottomNavigationBar: SizedBox(
          height: MediaQuery.of(context).size.height * 0.1,
        ),
      );

  Widget buildAppBar() => AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(0, 0, 0, 0),
        title: Text(
          'Nearby Stations',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: DropdownButton<Icon>(
              icon: const Icon(
                CupertinoIcons.list_dash,
                color: Colors.black,
              ),
              //elevation: 16,
              //style: const TextStyle(color: Colors.deepPurple),
              // underline: Container(
              //   height: 2,
              //   color: Colors.deepPurpleAccent,
              // ),

              onChanged: (Icon? newValue) {
                setState(() {
                  //dropdownValue = newValue!;
                });
              },
              items: [
                DropdownMenuItem(
                  child: Row(children: [
                    Icon(
                      CupertinoIcons.location_solid,
                      color: Colors.black,
                    ),
                    Text(' Nearby')
                  ]),
                  value: Icon(CupertinoIcons.list_bullet),
                  onTap: () {
                    setState(() {
                      currentIndex = 0;
                    });
                  },
                ),
                DropdownMenuItem(
                  child: Row(children: [
                    Icon(
                      CupertinoIcons.map_fill,
                      color: Colors.black,
                    ),
                    Text(' Map')
                  ]),
                  value: Icon(CupertinoIcons.location),
                  onTap: () {
                    setState(() {
                      currentIndex = 1;
                    });
                  },
                ),
              ],
              // items: <String>['Nearby Stations', 'Discover']
              //     .map<DropdownMenuItem<String>>((String value) {
              //   return DropdownMenuItem<String>(
              //     value: value,
              //     child: Text(value),
              //   );
              // }).toList(),
            ),
          ),
        ],
        leading: IconButton(
          icon: Icon(
            Icons.search_outlined,
            color: Colors.black,
          ),
          onPressed: () {
            Get.to(()=> WebScraping());
          },
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
