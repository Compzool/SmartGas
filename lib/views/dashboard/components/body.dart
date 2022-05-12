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
import 'package:flutter/material.dart';

import 'package:smartgas/colors/colors.dart';
import 'package:smartgas/controllers/userController.dart';
import 'package:smartgas/views/dashboard/components/bottom_bar.dart';
import 'package:smartgas/views/dashboard/components/bottom_bar_item.dart';
import 'package:smartgas/views/dashboard/components/card.dart';
import 'package:smartgas/views/dashboard/components/gas_prices.dart';
import 'package:smartgas/views/dashboard/components/gas_prices_1.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double xLR = MediaQuery.of(context).size.width;
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
                      "Welcome back ${UserController.instance.user.fullName.toString()}",
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
                          borderRadius: BorderRadius.circular(30),
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
                          padding: const EdgeInsets.all(20.0),
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
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                "20L",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
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
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
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
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                "60L",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
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
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
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
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                "Zaarouriye \n Station",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
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
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
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
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                "18 USD",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
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
              Container(
                child: SfCartesianChart(
                  // Initialize category axis
                  title: ChartTitle(
                    text: 'Weekly Filling',
                    backgroundColor: Colors.grey.withOpacity(0.2),
                  ),

                  primaryXAxis: CategoryAxis(),
                  series: <LineSeries<SalesData, String>>[
                    LineSeries<SalesData, String>(
                        // Bind data source
                        dataLabelSettings: DataLabelSettings(isVisible: true),
                        dataSource: <SalesData>[
                          SalesData('Mon', 35),
                          SalesData('Tue', 28),
                          SalesData('Wed', 45),
                          SalesData('Thu', 20),
                          SalesData('Fri', 55),
                          SalesData('Sat', 30),
                          SalesData('Sun', 50),
                        ],
                        // dataSource: <SalesData>[
                        //   SalesData('5/2', 35),
                        //   SalesData('12/2', 28),
                        //   SalesData('19/2', 34),
                        //   SalesData('28/2', 32),
                        //   SalesData('6/3', 40)
                        // ],
                        xValueMapper: (SalesData sales, _) => sales.year,
                        yValueMapper: (SalesData sales, _) => sales.sales),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
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
