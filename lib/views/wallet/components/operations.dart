import 'package:flutter/material.dart';

class Operations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Ink(
          decoration: ShapeDecoration(
            color: Colors.grey[200],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(9.0),
            ),
          ),
          child: IconButton(
            color: Colors.black,
            onPressed: () {},
            iconSize: 35,
            icon: const Icon(Icons.transfer_within_a_station),
          ),
        ),
        Ink(
          decoration: ShapeDecoration(
            color: Colors.grey[200],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(9.0),
            ),
          ),
          child: IconButton(
            color: Colors.black,
            onPressed: () {},
            iconSize: 35,
            icon: const Icon(Icons.payment),
          ),
        ),
        Ink(
          decoration: ShapeDecoration(
            color: Colors.grey[200],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(9.0),
            ),
          ),
          child: IconButton(
            color: Colors.black,
            onPressed: () {},
            iconSize: 35,
            icon: const Icon(Icons.qr_code),
          ),
        ),
      ],
    );
  }
}
