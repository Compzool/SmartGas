import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class SpinAnimation extends StatelessWidget {
  const SpinAnimation({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      color: Colors.white,
      child: SpinKitThreeInOut(
      itemBuilder: (BuildContext context, int index) {
        return DecoratedBox(
          decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: index.isEven ? Color.fromARGB(255, 255, 225, 0) : Color.fromARGB(255, 0, 0, 0),
          
      ),
    );
  },
),
    );
  }
}