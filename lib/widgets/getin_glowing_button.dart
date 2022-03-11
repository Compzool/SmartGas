import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:smartgas/widgets/spin_animation.dart';

import '../pages/home_page.dart';

class GetInGlowingButton extends StatefulWidget {
  final Color color1;
  final Color color2;
  final VoidCallback callback;
  const GetInGlowingButton(
      {Key? key,
      this.color1 = Colors.cyan,
      this.color2 = Colors.greenAccent,
      required this.callback})
      : super(key: key);
  @override
  _GetInGlowingButtonState createState() => _GetInGlowingButtonState();
}

class _GetInGlowingButtonState extends State<GetInGlowingButton> {
  var glowing = true;
  var scale = 1.0;

  @override
  Widget build(BuildContext context) {
    //On mobile devices, gesture detector is perfect
    //However for desktop and web we can show this effect on hover too
    return GestureDetector(
      onTapUp: (val) {
        setState(() {
          glowing = false;
          scale = 1.0;
        });
      },
      onTapDown: (val) {
        setState(() {
          glowing = true;
          scale = 1.1;
        });
      },
      // onTap: () {
      //   Get.to(() => SpinAnimation());
      //   Get.off(() => HomePage(), duration: Duration(seconds: 2));
      // },
      onTap: widget.callback,
      child: AnimatedContainer(
        transform: Matrix4.identity()..scale(scale),
        duration: Duration(milliseconds: 200),
        height: 48,
        width: 160,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            gradient: LinearGradient(
              colors: [
                widget.color1,
                widget.color2,
              ],
            ),
            boxShadow: glowing
                ? [
                    BoxShadow(
                      color: widget.color1.withOpacity(0.6),
                      spreadRadius: 1,
                      blurRadius: 16,
                      offset: Offset(-8, 0),
                    ),
                    BoxShadow(
                      color: widget.color2.withOpacity(0.6),
                      spreadRadius: 1,
                      blurRadius: 16,
                      offset: Offset(8, 0),
                    ),
                    BoxShadow(
                      color: widget.color1.withOpacity(0.2),
                      spreadRadius: 16,
                      blurRadius: 32,
                      offset: Offset(-8, 0),
                    ),
                    BoxShadow(
                      color: widget.color2.withOpacity(0.2),
                      spreadRadius: 16,
                      blurRadius: 32,
                      offset: Offset(8, 0),
                    )
                  ]
                : []),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Get In ",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
            Icon(
              Icons.account_circle_outlined,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
