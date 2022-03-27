import 'package:flutter/material.dart';
import 'package:smartgas/colors/colors.dart';

class BtmNavItem extends StatelessWidget {
  const BtmNavItem(
      {Key? key, required this.text, required this.icon, required this.whenTap})
      : super(key: key);
  final IconData icon;
  final String text;
  final Function? whenTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: whenTap as void Function()?,
      child: Column(
        children: [
          Icon(
            icon,
            color: Colors.black,
            //color: Colors.grey[200],
            size: 35.0,
          ),
          Text(
            text,
            style: TextStyle(
              color: Colors.black,
              //color: Colors.grey[200],
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
