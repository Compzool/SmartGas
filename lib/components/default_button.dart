import 'package:flutter/material.dart';

import 'package:smartgas/widgets/constants.dart';
import 'package:smartgas/widgets/size_config.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    this.text,
    this.press,
  }) : super(key: key);
  final String? text;
  final Function? press;

  @override
  Widget build(BuildContext context) {
    Color color1 = Color.fromARGB(255, 40, 65, 10);
    Color color2 = Color.fromARGB(255, 0, 212, 124);
    return Container(
      width: double.infinity,
      height: getProportionateScreenHeight(56),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          gradient: LinearGradient(
            colors: [
              color1,
              color2,
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: color1.withOpacity(0.6),
              spreadRadius: 1,
              blurRadius: 8,
              offset: Offset(-4, 0),
            ),
            BoxShadow(
              color: color2.withOpacity(0.6),
              spreadRadius: 1,
              blurRadius: 8,
              offset: Offset(4, 0),
            ),
            BoxShadow(
              color: color1.withOpacity(0.2),
              spreadRadius: 8,
              blurRadius: 16,
              offset: Offset(-4, 0),
            ),
            BoxShadow(
              color: color2.withOpacity(0.2),
              spreadRadius: 8,
              blurRadius: 16,
              offset: Offset(4, 0),
            )
          ]),
      child: TextButton(
        style: TextButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          primary: Colors.white,
          //backgroundColor: kPrimaryColor,
          //backgroundColor: Color.fromARGB(255, 40, 65, 10),
        ),
        onPressed: press as void Function()?,
        child: Text(
          text!,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(18),
            color: Colors.white,
          ),
        ),
      ),
    );
    // return SizedBox(
    //   width: double.infinity,
    //   height: getProportionateScreenHeight(56),
    //   child: TextButton(
    //     style: TextButton.styleFrom(
    //       shape:
    //           RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    //       primary: Colors.white,
    //       //backgroundColor: kPrimaryColor,
    //       backgroundColor: Color.fromARGB(255, 40, 65, 10),
    //     ),
    //     onPressed: press as void Function()?,
    //     child: Text(
    //       text!,
    //       style: TextStyle(
    //         fontSize: getProportionateScreenWidth(18),
    //         color: Colors.white,
    //       ),
    //     ),
    //   ),
    // );
  }
}
