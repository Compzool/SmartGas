import 'package:flutter/material.dart';

class MyCar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(30, 10, 10, 0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
              width: 80,
              height: 40,
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                child: const Text('BMW'),
              ),
            ),
            Container(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
              width: 80,
              height: 40,
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.amber),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                child: const Text('Toyota'),
              ),
            ),
            Container(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
              width: 80,
              height: 40,
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                child: const Text('Honda'),
              ),
            ),
            Container(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
              width: 80,
              height: 40,
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                child: const Text('Tesla'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
