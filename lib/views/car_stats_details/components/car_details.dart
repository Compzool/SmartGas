import 'package:flutter/material.dart';

class CarDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<double> tirePressureLtbRtb = [
      2.2,
      2.2,
      1.9,
      2.2,
    ];
    // TODO: implement build
    return Container(
      child: Column(
        children: [
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
    );
  }
}
