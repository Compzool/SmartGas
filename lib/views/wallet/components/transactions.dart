import 'package:flutter/material.dart';

class Transactions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
      child: Container(
        width: 350,
        height: 200,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      border: Border.all(
                        color: Colors.white,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(9.0),
                      ),
                      color: Colors.green[400],
                    ),
                    child: const Icon(
                      Icons.attach_money,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 0, 135.0, 0),
                    child: Column(
                      children: [
                        Text(
                          'Gas refill',
                          style: TextStyle(
                            color: Colors.lightGreen[700],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          '24-3-2022',
                          style: TextStyle(
                            fontSize: 10.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 20.0,
                    width: 50.0,
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      border: Border.all(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: const Text(
                      '-20 \$',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15.0,
              ),
              Row(
                children: [
                  Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      border: Border.all(
                        color: Colors.white,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(9.0),
                      ),
                      color: Colors.green[400],
                    ),
                    child: const Icon(
                      Icons.attach_money,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 0, 135.0, 0),
                    child: Column(
                      children: [
                        Text(
                          'Gas refill',
                          style: TextStyle(
                            color: Colors.lightGreen[700],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          '22-3-2022',
                          style: TextStyle(
                            fontSize: 10.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 20.0,
                    width: 50.0,
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      border: Border.all(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: const Text(
                      '-50 \$',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15.0,
              ),
              Row(
                children: [
                  Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      border: Border.all(
                        color: Colors.white,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(9.0),
                      ),
                      color: Colors.green[400],
                    ),
                    child: const Icon(
                      Icons.attach_money,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 0, 135.0, 0),
                    child: Column(
                      children: [
                        Text(
                          'Gas refill',
                          style: TextStyle(
                            color: Colors.lightGreen[700],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          '20-3-2022',
                          style: TextStyle(
                            fontSize: 10.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 20.0,
                    width: 50.0,
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      border: Border.all(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: const Text(
                      '-10 \$',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15.0,
              ),
              Row(
                children: [
                  Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      border: Border.all(
                        color: Colors.white,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(9.0),
                      ),
                      color: Colors.green[400],
                    ),
                    child: const Icon(
                      Icons.attach_money,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 0, 135.0, 0),
                    child: Column(
                      children: [
                        Text(
                          'Gas refill',
                          style: TextStyle(
                            color: Colors.lightGreen[700],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          '19-3-2022',
                          style: TextStyle(
                            fontSize: 10.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 20.0,
                    width: 50.0,
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      border: Border.all(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: const Text(
                      '-60 \$',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15.0,
              ),
              Row(
                children: [
                  Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      border: Border.all(
                        color: Colors.white,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(9.0),
                      ),
                      color: Colors.green[400],
                    ),
                    child: const Icon(
                      Icons.attach_money,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 0, 135.0, 0),
                    child: Column(
                      children: [
                        Text(
                          'Gas refill',
                          style: TextStyle(
                            color: Colors.lightGreen[700],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          '15-3-2022',
                          style: TextStyle(
                            fontSize: 10.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 20.0,
                    width: 50.0,
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      border: Border.all(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: const Text(
                      '-30 \$',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
