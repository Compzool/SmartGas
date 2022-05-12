import 'package:flutter/material.dart';

import 'components/body.dart';

class CarSD extends StatelessWidget {
  const CarSD({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: const BoxDecoration(
          color: Colors.white,
          // image: DecorationImage(
          //   image: AssetImage('assets/images/eco11.jpg'),
          //   fit: BoxFit.cover,
          //   opacity: 0.6,
          // ),
        ),
        child: Body(),
      ),
    );
  }
}
