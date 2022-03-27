import 'package:flutter/material.dart';

import '../../../colors/colors.dart';

class GasPrices extends StatelessWidget {
  const GasPrices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        //color: Colors.grey[200]!.withOpacity(0.8), //1
        color: AppColors.color1.withOpacity(0.9), //2
        // border: Border.all(
        //   color: AppColors.color1,
        // ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            offset: Offset(-7, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.07,
            child: Center(
              child: Text(
                'Today Prices',
                style: TextStyle(
                  //color: AppColors.color1, //1
                  color: Colors.white, //2
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                ),
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.1,
            decoration: BoxDecoration(
              border: Border.symmetric(
                horizontal: BorderSide(
                  color: Colors.grey,
                  width: 1,
                ),
              ),
            ),
            child: Center(
              child: Text(
                '95 Octane: 431000 L.L.',
                style: TextStyle(
                  fontSize: 18,
                  //color: AppColors.color1.withGreen(100),//1
                  color: Colors.white, //2
                ),
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.1,
            child: Center(
              child: Text(
                '98 Octane: 441000 L.L.',
                style: TextStyle(
                  fontSize: 18,
                  //color: AppColors.color1.withGreen(100),//1
                  color: Colors.white, //2
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
