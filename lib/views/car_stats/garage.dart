import 'package:get/get.dart';
import 'package:smartgas/views/car_details/car_details.dart';
import 'package:smartgas/views/car_stats/main.dart';
import 'package:smartgas/views/car_stats/refuel.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smartgas/views/car_stats/car_model.dart';
import 'package:smartgas/views/electric_car/electric_car.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../controllers/carstats_controller.dart';

class FuelCar extends StatefulWidget {
  final Car car;
  const FuelCar({Key? key, required this.car}) : super(key: key);

  @override
  State<FuelCar> createState() => _FuelCarState();
}

class _FuelCarState extends State<FuelCar> {
  late TooltipBehavior _tooltipBehavior;
  int selectedIndex = 0;
  bool status = false;
  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Car car = widget.car;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    var carStatsCont = Get.find<CarStatsCont>();
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: "Hello!\n",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black)),
                          TextSpan(
                              text: car.user,
                              style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                        ]),
                      ),
                      // TextButton(
                      //   onPressed: () {

                      //   },
                      //   child: Icon(
                      //     Icons.menu_sharp,
                      //     color: Colors.black,
                      //   ),
                      //   style: TextButton.styleFrom(
                      //       backgroundColor: Colors.grey[200],
                      //       minimumSize: Size(5, 10),
                      //       shape: RoundedRectangleBorder(
                      //           borderRadius: BorderRadius.circular(10))),
                      // ),
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
                                    () => Get.appUpdate();
                                  },
                                ),
                                FlatButton(
                                  child: Text('Tire Pressure'),
                                  onPressed: () {
                                    carStatsCont.screens.value[0] =
                                        CarDetails();
                                    () => Get.appUpdate();
                                  },
                                ),
                                FlatButton(
                                  child: Text('Tesla Model X'),
                                  onPressed: () {
                                    carStatsCont.screens.value[0] =
                                        ElectricCar();
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
                  Center(
                    child: Container(
                        width: width,
                        //child: Image.asset(car.urlImage),
                        child: Image.asset('assets/images/lambo.png')),
                  ),
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: "Fuel Usage\n",
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.grey[800],
                              fontWeight: FontWeight.bold)),
                      // TextSpan(
                      //     text: car.date,
                      //     style: TextStyle(fontSize: 16, color: Colors.black)),
                    ]),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                      child: Container(
                          height: 200,
                          child: SfCartesianChart(
                              primaryXAxis: CategoryAxis(),
                              // Chart title
                              //title: ChartTitle(text: 'Half yearly sales analysis'),
                              // Enable legend
                              //legend: Legend(isVisible: true),
                              // Enable tooltip
                              tooltipBehavior: _tooltipBehavior,
                              series: <SplineSeries<FuelData, String>>[
                                SplineSeries<FuelData, String>(
                                    dataSource: <FuelData>[
                                      FuelData(month: 'Jan', refuel: 100),
                                      FuelData(month: 'Feb', refuel: 79),
                                      FuelData(month: 'Mar', refuel: 50),
                                      FuelData(month: 'Apr', refuel: 69),
                                      FuelData(month: 'May', refuel: 200),
                                    ],
                                    xValueMapper: (FuelData usage, _) =>
                                        usage.month,
                                    yValueMapper: (FuelData usage, _) =>
                                        usage.refuel,
                                    color: Colors.greenAccent,
                                    width: 2,
                                    splineType: SplineType.clamped,
                                    cardinalSplineTension: 0.6,
                                    // Enable data label
                                    dataLabelSettings:
                                        DataLabelSettings(isVisible: true),
                                    markerSettings:
                                        MarkerSettings(isVisible: true))
                              ]))),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: ToggleSwitch(
                      minWidth: 40,
                      minHeight: 20.0,
                      initialLabelIndex: selectedIndex,
                      cornerRadius: 20.0,
                      activeFgColor: Colors.white,
                      inactiveBgColor: Colors.green,
                      inactiveFgColor: Colors.greenAccent,
                      totalSwitches: 2,
                      icons: [
                        FontAwesomeIcons.carOn,
                        FontAwesomeIcons.carTunnel,
                      ],
                      iconSize: 30.0,
                      activeBgColors: [
                        [Colors.cyan, Colors.orange],
                        [Colors.blue, Colors.red]
                      ],
                      animate:
                          true, // with just animate set to true, default curve = Curves.easeIn
                      curve: Curves
                          .bounceInOut, // animate must be set to true when using custom curve
                      onToggle: (index) {
                        print('switched to: $index');
                        setState(() {
                          selectedIndex = index!;
                        });
                      },
                    ),
                  ),
                  // ),
                  //SizedBox(height: 10,),

                  selectedIndex == 0
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            fuelGauge(fuel: 6.5, type: "Fuel Usage"),
                            fuelGauge(fuel: 12.5, type: "Fuel Remaining"),
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            distanceGauge(
                                distance: 22.7, type: "Average Distance"),
                            distanceGauge(
                                distance: 30.3, type: "Distance Remaining"),
                          ],
                        ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class fuelGauge extends StatelessWidget {
  final double fuel;
  final String type;
  fuelGauge({Key? key, required this.fuel, required this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 150,
        height: 150,
        child: SfRadialGauge(
            title: GaugeTitle(text: "$type", alignment: GaugeAlignment.center),
            enableLoadingAnimation: true,
            axes: <RadialAxis>[
              RadialAxis(minimum: 0, maximum: 20, ranges: <GaugeRange>[
                GaugeRange(
                    startValue: 0,
                    endValue: 5,
                    gradient: SweepGradient(
                      colors: const <Color>[Colors.red, Colors.orangeAccent],
                    )),
                GaugeRange(
                    startValue: 5,
                    endValue: 10,
                    gradient: SweepGradient(
                      colors: const <Color>[
                        Color.fromARGB(255, 205, 188, 30),
                        Colors.yellowAccent,
                        Color.fromARGB(255, 230, 255, 3)
                      ],
                    )),
                GaugeRange(
                    startValue: 10,
                    endValue: 15,
                    gradient: SweepGradient(
                      colors: const <Color>[
                        Color.fromARGB(255, 11, 215, 89),
                        Color.fromARGB(255, 15, 175, 20)
                      ],
                    )),
                GaugeRange(
                    startValue: 15,
                    endValue: 20,
                    gradient: SweepGradient(
                      colors: const <Color>[
                        Color.fromARGB(255, 100, 183, 11),
                        Color.fromARGB(255, 4, 255, 0)
                      ],
                    ))
              ], pointers: <GaugePointer>[
                NeedlePointer(
                    value: fuel,
                    needleLength: 0.95,
                    enableAnimation: true,
                    animationType: AnimationType.bounceOut,
                    needleStartWidth: 1.5,
                    needleEndWidth: 6,
                    needleColor: Colors.red,
                    knobStyle: KnobStyle(knobRadius: 0.09))
              ], annotations: <GaugeAnnotation>[
                GaugeAnnotation(
                    widget: Container(
                        margin: EdgeInsets.only(top: 30),
                        child: Text('$fuel',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold))),
                    angle: 90,
                    positionFactor: 0.5)
              ])
            ]));
  }
}

class distanceGauge extends StatelessWidget {
  final double distance;
  final String type;
  distanceGauge({Key? key, required this.distance, required this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 150,
        height: 150,
        child: SfRadialGauge(
            title: GaugeTitle(text: "$type", alignment: GaugeAlignment.center),
            enableLoadingAnimation: true,
            axes: <RadialAxis>[
              RadialAxis(minimum: 0, maximum: 80, ranges: <GaugeRange>[
                GaugeRange(
                    startValue: 0,
                    endValue: 20,
                    gradient: SweepGradient(
                      colors: const <Color>[Colors.red, Colors.orangeAccent],
                    )),
                GaugeRange(
                    startValue: 20,
                    endValue: 40,
                    gradient: SweepGradient(
                      colors: const <Color>[
                        Color.fromARGB(255, 205, 188, 30),
                        Colors.yellowAccent,
                        Color.fromARGB(255, 230, 255, 3)
                      ],
                    )),
                GaugeRange(
                    startValue: 40,
                    endValue: 60,
                    gradient: SweepGradient(
                      colors: const <Color>[
                        Color.fromARGB(255, 11, 215, 89),
                        Color.fromARGB(255, 15, 175, 20)
                      ],
                    )),
                GaugeRange(
                    startValue: 60,
                    endValue: 80,
                    gradient: SweepGradient(
                      colors: const <Color>[
                        Color.fromARGB(255, 100, 183, 11),
                        Color.fromARGB(255, 4, 255, 0)
                      ],
                    ))
              ], pointers: <GaugePointer>[
                NeedlePointer(
                    value: distance,
                    needleLength: 0.95,
                    enableAnimation: true,
                    animationType: AnimationType.bounceOut,
                    needleStartWidth: 1.5,
                    needleEndWidth: 6,
                    needleColor: Colors.red,
                    knobStyle: KnobStyle(knobRadius: 0.09))
              ], annotations: <GaugeAnnotation>[
                GaugeAnnotation(
                    widget: Container(
                        margin: EdgeInsets.only(top: 30),
                        child: Text('$distance',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold))),
                    angle: 90,
                    positionFactor: 0.5)
              ])
            ]));
  }
}
