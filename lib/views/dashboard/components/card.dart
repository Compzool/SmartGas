import 'package:flutter/material.dart';

import '../../../colors/colors.dart';

class CardDash extends StatelessWidget {
  const CardDash(
      {Key? key, required this.text, required this.iconData, this.size = 20})
      : super(key: key);
  final String text;
  final IconData iconData;
  final double size;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.26,
      height: 150,
      decoration: BoxDecoration(
        // border: Border.all(
        //   color: AppColors.color1,
        // ),
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          // BoxShadow(
          //   color: AppColors.color1.withOpacity(0.5),
          //   offset: const Offset(-1, -5),
          //   blurRadius: 4,
          //   //spreadRadius: -1,
          //   blurStyle: BlurStyle.outer,
          // ),
          BoxShadow(
            color: AppColors.color1.withOpacity(0.05),
            offset: const Offset(-7, 5),
            blurRadius: 1,
            //spreadRadius: 1,
            blurStyle: BlurStyle.normal,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              iconData,
              color: Colors.black,
              size: 50.0,
            ),
            const SizedBox(),
            Text(
              this.text,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: size,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
