// import 'package:flutter/material.dart';
// import 'package:smartgas/colors/colors.dart';
// import 'package:smartgas/views/dashboard/components/bottom_bar.dart';
// import 'package:smartgas/views/dashboard/components/bottom_bar_item.dart';
// import 'package:smartgas/views/dashboard/components/card.dart';
// import 'package:smartgas/views/dashboard/components/gas_prices.dart';
// import 'package:smartgas/views/dashboard/components/gas_prices_1.dart';

// class Body extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     double xLR = MediaQuery.of(context).size.width;
//     return SafeArea(
//       child: Padding(
//         padding: const EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 0.0),
//         child: Column(
//           mainAxisSize: MainAxisSize.max,
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               height: MediaQuery.of(context).size.height * 0.1,
//               decoration: BoxDecoration(
//                 color: Colors.white.withOpacity(0.2),
//                 borderRadius: BorderRadius.circular(30),
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Container(
//                     width: MediaQuery.of(context).size.width * 0.18,
//                     height: MediaQuery.of(context).size.width * 0.18,
//                     child: CircleAvatar(
//                       backgroundImage: NetworkImage(
//                           // scale: 0.1,
//                           "https://upload.wikimedia.org/wikipedia/commons/thumb/3/34/Elon_Musk_Royal_Society_%28crop2%29.jpg/251px-Elon_Musk_Royal_Society_%28crop2%29.jpg"),
//                     ),
//                   ),
//                   SizedBox(
//                     width: MediaQuery.of(context).size.width * 0.02,
//                   ),
//                   Text(
//                     'Hello, elon',
//                     style: TextStyle(
//                       color: Colors.grey[900],
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       shadows: [],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.03,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Text(
//                   'Find a mechanic',
//                   style: TextStyle(
//                     color: Colors.grey[900],
//                     fontSize: 25,
//                     fontWeight: FontWeight.w500,
//                     shadows: [
//                       Shadow(
//                         color: AppColors.color1.withOpacity(0.2),
//                         offset: Offset(-4, -2),
//                         blurRadius: 4,
//                       ),
//                       Shadow(
//                         color: AppColors.color1.withOpacity(1),
//                         offset: Offset(0, 0),
//                         blurRadius: 5,
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.01,
//             ),
//             SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   CardDash(
//                     text: 'Calc',
//                     iconData: Icons.calculate_outlined,
//                   ),
//                   SizedBox(
//                     width: MediaQuery.of(context).size.width * 0.04,
//                   ),
//                   CardDash(text: 'Car', iconData: Icons.car_repair_outlined),
//                   SizedBox(
//                     width: MediaQuery.of(context).size.width * 0.04,
//                   ),
//                   CardDash(text: 'Taxi', iconData: Icons.local_taxi_outlined),
//                   SizedBox(
//                     width: MediaQuery.of(context).size.width * 0.04,
//                   ),
//                   CardDash(
//                     text: 'Bicycle',
//                     iconData: Icons.bike_scooter_outlined,
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.04,
//             ),
//             GasPrices1(),
//             // SizedBox(
//             //   height: MediaQuery.of(context).size.height * 0.05,
//             // ),
//             // BtmBar(),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';

import 'package:get/get.dart';
import 'package:smartgas/colors/colors.dart';
import 'package:smartgas/controllers/fill_controller.dart';
import 'package:smartgas/controllers/location_controller.dart';
import 'package:smartgas/controllers/userController.dart';
import 'package:smartgas/views/dashboard/components/bottom_bar.dart';
import 'package:smartgas/views/dashboard/components/bottom_bar_item.dart';
import 'package:smartgas/views/dashboard/components/card.dart';
import 'package:smartgas/views/dashboard/components/gas_prices.dart';
import 'package:smartgas/views/dashboard/components/gas_prices_1.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../fills/fills.dart';

class Body extends StatefulWidget {
  Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  // void initState() {
  //   // TODO: implement initState
  //   Get.put<FillController>(FillController());
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    double t95Price = 431000;
    double t98Price = 441000;

    FillController fillController = Get.put(FillController());
    List<SalesData> salesData = fillController.salesData;
    // if (fillController.initialized && fillController.todos != null) {
    //   fillController.todos
    //       .sort((a, b) => a.date.seconds.compareTo(b.date.seconds));
    //   List<SalesData> salesData = [];
    //   if (fillController.initialized && fillController.todos != null) {
    //     for (int i = 0; i < fillController.todos.length; i++) {
    //       salesData.add(SalesData(
    //           "${DateTime.fromMillisecondsSinceEpoch(fillController.todos[i].date.seconds * 1000).day.toString()}/${DateTime.fromMillisecondsSinceEpoch(fillController.todos[i].date.seconds * 1000).month.toString()}",
    //           fillController.todos[i].quantity));
    //     }
    //   }

    return SafeArea(
      bottom: false,
      maintainBottomViewPadding: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 0.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.1,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.18,
                      height: MediaQuery.of(context).size.width * 0.18,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            // scale: 0.1,
                            UserController.instance.user.pictureUrl.toString()),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.02,
                    ),
                    Text(
                      "Welcome back ${UserController.instance.user.fullName?.split(" ").first}",
                      style: TextStyle(
                        color: Colors.grey[900],
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        shadows: [],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).size.height * 0.15,
                        decoration: BoxDecoration(
                          //color: Colors.cyan,
                          borderRadius: BorderRadius.circular(
                            MediaQuery.of(context).size.width * 0.075,
                          ),
                          gradient: LinearGradient(
                            colors: [
                              Colors.cyan,
                              Colors.green,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(
                              MediaQuery.of(context).size.width * 0.05),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.check,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    "Last Filled",
                                    style: TextStyle(
                                      color: Colors.grey[200],
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.035,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              GetX<FillController>(
                                builder: (_) {
                                  return Text(
                                    //"${fillController.todos[fillController.todos.length - 1].quantity.toString()} L",
                                    fillController.lastFilled().toString(),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.045,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).size.height * 0.15,
                        decoration: BoxDecoration(
                          //color: Colors.purpleAccent,
                          gradient: LinearGradient(
                            colors: [
                              Colors.purple,
                              Colors.orange,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(
                              MediaQuery.of(context).size.width * 0.075),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(
                              MediaQuery.of(context).size.width * 0.05),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.calendar_view_week,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    "Weekly Filled",
                                    style: TextStyle(
                                      color: Colors.grey[200],
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.035,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Obx(() => Text(
                                    "${fillController.weeklyFills().toString()}",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.045,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.02,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).size.height * 0.15,
                        decoration: BoxDecoration(
                          //color: Colors.redAccent,
                          gradient: LinearGradient(
                            colors: [
                              Colors.redAccent,
                              Color.fromARGB(255, 208, 255, 0),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(
                              MediaQuery.of(context).size.width * 0.075),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(
                              MediaQuery.of(context).size.width * 0.05),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    "Last Visited",
                                    style: TextStyle(
                                      color: Colors.grey[200],
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.035,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              GetX<FillController>(
                                builder: (_) {
                                  return Text(
                                    //"${fillController.todos[fillController.todos.length - 1].station}",
                                    fillController.lastVisited(),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.045,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).size.height * 0.15,
                        decoration: BoxDecoration(
                          //color: Colors.orange,
                          gradient: LinearGradient(
                            colors: [
                              Colors.pinkAccent,
                              Color.fromARGB(255, 118, 30, 233),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(
                              MediaQuery.of(context).size.width * 0.075),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(
                              MediaQuery.of(context).size.width * 0.05),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    CupertinoIcons.money_dollar,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    "Last Payment",
                                    style: TextStyle(
                                      color: Colors.grey[200],
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.035,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Obx(() => Text(
                                    //"${fillController.todos[fillController.todos.length - 1].quantity * t95Price / 20} L.L.",
                                    "${fillController.lastPayment()} L.L.",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.045,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),

              GetX<FillController>(
                  init: Get.put<FillController>(FillController()),
                  builder: (FillController fillController) {
                    if (fillController != null &&
                        fillController.todos != null) {
                      return Container(
                        child: SfCartesianChart(
                          // Initialize category axis
                          tooltipBehavior: TooltipBehavior(enable: true),
                          title: ChartTitle(
                            text: 'Latest Fillings',
                            backgroundColor: Colors.grey.withOpacity(0.1),
                            textStyle: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          ),

                          primaryXAxis: CategoryAxis(),
                          series: <LineSeries<SalesData, String>>[
                            LineSeries<SalesData, String>(
                                // Bind data source
                                dataLabelSettings:
                                    DataLabelSettings(isVisible: true),
                                dataSource: salesData,
                                xValueMapper: (SalesData sales, _) =>
                                    sales.year,
                                yValueMapper: (SalesData sales, _) =>
                                    sales.sales),
                          ],
                        ),
                      );
                    } else {
                      return Text("loading...");
                    }
                  }),

              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),

              GasPrices1(),
              // SizedBox(
              //   height: MediaQuery.of(context).size.height * 0.05,
              // ),
              // BtmBar(),
            ],
          ),
        ),
      ),
    );
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}
