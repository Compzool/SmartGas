import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartgas/views/apply_additional_balance/drop_down.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Icon(
                    Icons.payment,
                    color: Colors.white,
                    size: 20,
                  ),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(const CircleBorder()),
                    fixedSize: MaterialStateProperty.all(const Size(40, 40)),
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0xBE26A756)),
                  ),
                ),
                const Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                  child: Text(
                    'Payments',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(110, 0, 0, 0),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.keyboard_arrow_right_outlined,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 0, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Icon(
                    Icons.add_circle_outline,
                    color: Colors.white,
                    size: 20,
                  ),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(const CircleBorder()),
                    fixedSize: MaterialStateProperty.all(const Size(40, 40)),
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromARGB(255, 255, 207, 50)),
                  ),
                ),
                Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                    child: TextButton(
                      onPressed: () {
                        Get.to(()=> DropDown());
                      },
                      child: Text('Apply for additional balance'),
                      style: TextButton.styleFrom(
                        primary: Colors.black,
                        textStyle: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    )),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.keyboard_arrow_right_outlined,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 0, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Icon(
                    Icons.privacy_tip,
                    color: Colors.white,
                    size: 20,
                  ),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(const CircleBorder()),
                    fixedSize: MaterialStateProperty.all(const Size(40, 40)),
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0xFF9E9E9E)),
                  ),
                ),
                const Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                  child: Text(
                    'Privacy',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(130, 0, 0, 0),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.keyboard_arrow_right_outlined,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
