import 'package:flutter/material.dart';
import 'package:smartgas/colors/colors.dart';
import 'package:smartgas/views/dashboard/components/bottom_bar.dart';
import 'package:smartgas/views/dashboard/components/bottom_bar_item.dart';
import 'package:smartgas/views/dashboard/components/card.dart';
import 'package:smartgas/views/dashboard/components/gas_prices.dart';
import 'package:smartgas/views/dashboard/components/gas_prices_1.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double xLR = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 0.0),
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
                          "https://upload.wikimedia.org/wikipedia/commons/thumb/3/34/Elon_Musk_Royal_Society_%28crop2%29.jpg/251px-Elon_Musk_Royal_Society_%28crop2%29.jpg"),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.02,
                  ),
                  Text(
                    'Hello, elon',
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
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Find a mechanic',
                  style: TextStyle(
                    color: Colors.grey[900],
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    shadows: [
                      Shadow(
                        color: AppColors.color1.withOpacity(0.2),
                        offset: Offset(-4, -2),
                        blurRadius: 4,
                      ),
                      Shadow(
                        color: AppColors.color1.withOpacity(1),
                        offset: Offset(0, 0),
                        blurRadius: 5,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CardDash(
                    text: 'Calc',
                    iconData: Icons.calculate_outlined,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.04,
                  ),
                  CardDash(text: 'Car', iconData: Icons.car_repair_outlined),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.04,
                  ),
                  CardDash(text: 'Taxi', iconData: Icons.local_taxi_outlined),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.04,
                  ),
                  CardDash(
                    text: 'Bicycle',
                    iconData: Icons.bike_scooter_outlined,
                  ),
                ],
              ),
            ),
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
    );
  }
}
