import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smartgas/widgets/app_largetext.dart';
import 'package:smartgas/widgets/app_text.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class GreetingPage extends StatefulWidget {
  GreetingPage({Key? key}) : super(key: key);

  @override
  State<GreetingPage> createState() => _GreetingPageState();
}

class _GreetingPageState extends State<GreetingPage> {
  final liquidController = LiquidController();
  bool isLastPage = false;
  List images = [
    "welcome-1.png",
    "welcome-2.jpg",
    "welcome-3.jpg",
    "coder.png"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children:[ LiquidSwipe(
          onPageChangeCallback: (activePageIndex) {
            setState(() => isLastPage = activePageIndex == 3);
          },
          liquidController: liquidController,
          enableSideReveal: true,
          enableLoop: false,
          waveType: WaveType.liquidReveal,
          slideIconWidget: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ), // Icon
          pages: [
            buildPage( urlImage: 'images/${images[0]}', title: 'smartgas', subtitle: 'mingles'),
            buildPage( urlImage: 'images/${images[1]}', title: 'smartgas', subtitle: 'mingles'),
            buildPage( urlImage: 'images/${images[2]}', title: 'smartgas', subtitle: 'mingles'),
            buildPage( urlImage: 'images/${images[3]}', title: 'smartgas', subtitle: 'mingles'),
            ]
            
          ),
          Positioned (
              bottom: 0,
              left: 16,
              right: 32,
              child: isLastPage ? TextButton(
                    style: TextButton.styleFrom(primary: Colors.tealAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)
                    ),
                    backgroundColor: Colors.cyan,
                    minimumSize: Size.fromHeight(80)
                    ),
                    
                    child: const Text('Get in',style: TextStyle(fontSize: 24),),
                    onPressed: () {
                      liquidController.jumpToPage(page: 3);
                    },
                ): Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(primary: Colors.white),
                    child: const Text('SKIP'),
                    onPressed: () {
                      liquidController.jumpToPage(page: 3);
                    },
                ),
                  
                  AnimatedSmoothIndicator(
                    activeIndex: liquidController.currentPage,
                    count: 3,
                    effect: ExpandingDotsEffect (
                      spacing: 16,
                      dotColor:  Colors.white54,
                      activeDotColor: Colors.white,
                      
                  ), 
                  onDotClicked: (index) {
                      liquidController.animateToPage (page: index);
                    },
                    
                  ),
                  
                   // TextButton
                  TextButton (
                    style: TextButton.styleFrom(primary: Colors.white),
                    child: const Text('NEXT'),
                    onPressed: () {
                      final page = liquidController.currentPage + 1;
                      liquidController.animateToPage (
                        page: page > 4 ? 3 : page,
                        //duration: 400,
                      );
                    },
                ), // TextButton
                ]
              )
            ), // Positioned
        ]
      ),
    );
  }
// Widget buildPage ({
//   required Color color,
//   required String urlImage,
//   required String title,
//   required String subtitle,
// }) => Container(
//   width: double.maxFinite,
//   decoration: BoxDecoration(
//         color: color,
//         image: DecorationImage(
//           image: AssetImage(
//               urlImage),
//           fit: BoxFit.cover,
//         )),
  
//   child: Column(
//   mainAxisAlignment: MainAxisAlignment.end,
//   children: [
//     // Image.asset (
//     //   urlImage,
//     //   fit: BoxFit.cover,
//     //   width: double.maxFinite,
//     // ),
//    const SizedBox(height: 32),
//     Text(
//       title,
//       style: TextStyle(
//         color: Colors.teal.shade700,
//         fontSize: 32,
//         fontWeight: FontWeight.bold,
//       ),
//     ),
//     const SizedBox(height: 24,),
//     Container(
//       padding: const EdgeInsets.symmetric(vertical: 50),
//       child: Text(
//         subtitle,
//         style: const TextStyle(color: Colors.indigoAccent),
//       ),
//     )
//     ] 
//   )
// );

Widget buildPage ({
  //required Color color,
  required String urlImage,
  required String title,
  required String subtitle,
}) => Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(urlImage))),
            child: Container(
              margin: EdgeInsets.only(top: 120, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppLargeText(
                        text: title,
                        size: 40,
                      ),
                      AppText(
                        text: subtitle,
                        size: 25,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                     
                    ]
                )
              ]
             )
            )

);


}