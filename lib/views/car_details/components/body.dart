// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartgas/views/electric_car/electric_car.dart';

import '../../../controllers/carstats_controller.dart';
import '../../car_stats/main.dart';
import '../car_details.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String carType = 'Mercedes Benz C300';
    String carModel1 = 'Mercedes Benz C300';
    String carModel2 = 'Tesla Model X';
    var carStatsCont = Get.put(CarStatsCont());
    carStatsCont.isElectric.value = false;
    carStatsCont.isStats.value = true;
    List<double> tirePressureLtbRtb = [
      2.2,
      2.2,
      1.9,
      2.2,
    ];
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
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
                            onPressed: () {
                              carStatsCont.screens.value[0] = CarStats();
                              carStatsCont.isElectric.value = false;
                              carStatsCont.isStats.value = true;
                            },
                          ),
                          FlatButton(
                            child: Text('Tire Pressure'),
                            onPressed: () {
                              carStatsCont.screens.value[0] = CarDetails();
                              carStatsCont.isElectric.value = false;
                              carStatsCont.isStats.value = false;
                            },
                          ),
                          FlatButton(
                            child: Text('Tesla Model X'),
                            onPressed: () {
                              carStatsCont.screens.value[0] = ElectricCar();
                              carStatsCont.isElectric.value = true;
                              carStatsCont.isStats.value = false;
                              carStatsCont.update();
                            },
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.width * 0.15,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Tire Pressure',
                          style: TextStyle(
                            color: Colors.grey[900],
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            shadows: [],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Icon(
                            Icons.arrow_drop_down,
                            color: Colors.grey[900],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${tirePressureLtbRtb[0].toStringAsFixed(1)} BAR',
                        style: TextStyle(
                          color: Colors.green[900],
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                          shadows: [],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.25,
                      ),
                      Text(
                        '${tirePressureLtbRtb[1].toStringAsFixed(1)} BAR',
                        style: TextStyle(
                          color: Colors.green[900],
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                          shadows: [],
                        ),
                      ),
                    ],
                  ),
                  Image.asset(
                    'assets/images/car-img.jpg',
                    height: MediaQuery.of(context).size.height * 0.4,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${tirePressureLtbRtb[2].toStringAsFixed(1)} BAR',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                          shadows: [],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.25,
                      ),
                      Text(
                        '${tirePressureLtbRtb[3].toStringAsFixed(1)} BAR',
                        style: TextStyle(
                          color: Colors.green[900],
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                          shadows: [],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
