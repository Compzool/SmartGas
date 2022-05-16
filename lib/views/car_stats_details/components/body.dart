// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartgas/views/car_stats/car_data.dart';
import 'package:smartgas/views/car_stats_details/components/car_stats.dart';
import 'package:smartgas/views/electric_car/electric_car.dart';

import '../../../controllers/carstats_controller.dart';
import 'package:smartgas/views/car_stats_details/components/car_details.dart';
//import '../../car_stats/main.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int index = 0;

  void _setIndex(i) {
    setState(() {
      index = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    String carType = 'Mercedes Benz C300';
    String carModel1 = 'Mercedes Benz C300';
    String carModel2 = 'Tesla Model X';
    var carStatsCont = Get.put(CarStatsCont());
    var screens = [
      FuelCar(car: cars[0]),
      CarDetails(),
      ElectricCar(),
    ];
    return SafeArea(
      bottom: false,
      child: Expanded(
        child: Padding(
          padding: const EdgeInsets.only(
              left: 10.0, right: 10.0, top: 10.0, bottom: 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '$carType',
                        style: TextStyle(
                          color: Colors.grey[900],
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          shadows: [],
                        ),
                      ),
                      Text(
                        'Control Panel',
                        style: TextStyle(
                          color: Colors.grey[900],
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          shadows: [],
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.dialog(
                        AlertDialog(
                          // title: Text('Are you sure?'),
                          // content: Text('This will log you out.'),
                          actions: [
                            FlatButton(
                              child: Text('Car Stats'),
                              onPressed: () => {_setIndex(0), Get.back()},
                            ),
                            FlatButton(
                              child: Text('Tire Pressure'),
                              onPressed: () => {_setIndex(1), Get.back()},
                            ),
                            FlatButton(
                              child: Text('Tesla Model X'),
                              onPressed: () => {_setIndex(2), Get.back()},
                            ),
                          ],
                        ),
                      );
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.125,
                      height: MediaQuery.of(context).size.width * 0.125,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.menu,
                          color: Colors.grey[900],
                          size: MediaQuery.of(context).size.width * 0.07,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              Expanded(child: screens[index]),
            ],
          ),
        ),
      ),
    );
  }
}
