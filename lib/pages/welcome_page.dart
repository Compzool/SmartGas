import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:smartgas/colors/colors.dart';
import 'package:smartgas/pages/home_page.dart';
import 'package:smartgas/widgets/app_largetext.dart';
import 'package:smartgas/widgets/app_text.dart';
import 'package:smartgas/widgets/responsive_button.dart';
import 'package:smartgas/widgets/spin_animation.dart';

class WelcomePage extends StatelessWidget {
  WelcomePage({ Key? key }) : super(key: key);
  List images = [
    "welcome-1.png",
    "welcome-2.jpg",
    "welcome-3.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      backgroundColor: Colors.white,
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: images.length,
        itemBuilder: ((context, index) {
          return Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("images/"+images[index])
              )
            ),
            child: Container(
              margin: EdgeInsets.only(top: 120,left: 20,right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppLargeText(text: "Smart Gas",size: 40,),
                      AppText(text: "Making Your Lives Easier",size: 25,),
                      SizedBox(height: 10,),
                      Container(
                        width: 250,
                        child: AppText(
                          text: "BY THE ORDER OF THE PEAKY MINGLES",
                          size: 14,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 20,),
                      index == (images.length - 1)?
                      GestureDetector(
                        onTap: () { 
                          
                          Get.to(()=>SpinAnimation()); 
                          Get.off(() => HomePage(),duration: Duration(seconds: 1));
                        },
                        child: ResponsiveButton(width: 150)
                        ) : SizedBox()
                    ],
                  ),
                  Column(
                    children: List.generate(3,(indexDots){
                      return Container(
                        
                        margin: EdgeInsets.only(bottom: 2),
                        width: 8,
                        height: index == indexDots? 25:8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: index == indexDots? AppColors.mainColor : AppColors.mainColor.withOpacity(0.7)
                        ),
                      );
                    }),
                  )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}