import 'package:flutter/material.dart';
import 'package:smartgas/colors/colors.dart';

// ignore: must_be_immutable
class ResponsiveButton extends StatelessWidget {
  bool? isResponsive;
  double? width;
  ResponsiveButton({ Key? key ,this.isResponsive = false, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.mainColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black87.withOpacity(0.4),
            spreadRadius:1,
            blurRadius: 2,
            //offset: Offset(0, 3),
          )
        ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("images/button-one.png"),
        ],
      ),
    );
  }
}