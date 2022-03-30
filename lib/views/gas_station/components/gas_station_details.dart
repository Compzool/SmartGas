import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class GasDetails extends StatelessWidget {
  final int index;
  const GasDetails({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List images = ["medco.jpg", "IPT.jpg", "hypco.png"];
    double width = MediaQuery.of(context).size.width * 0.9;
    double height = MediaQuery.of(context).size.height * 0.35;
    return Scaffold(
      //backgroundColor: Color(0xf8f6f0ff),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        //mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(Icons.arrow_back_ios_new_rounded)),
                //SizedBox(width: 10,),
                Text("Discover",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
                //Spacer(),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.more_horiz_sharp,
                      size: 30,
                    ))
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Center(
            child: Stack(
              //fit: StackFit.expand,
              children: [
                Container(
                  width: width,
                  height: height,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                        image: AssetImage("assets/images/${images[index]}"),
                        fit: BoxFit.cover),
                  ),
                ),
                Positioned(
                    top: 30,
                    left: 30,
                    child: ElevatedButton.icon(
                      icon: Icon(
                        FontAwesomeIcons.angleLeft,
                        color: Colors.grey[350],
                        size: 12.0,
                      ),
                      // ignore: prefer_const_constructors
                      label: Text("Garage",
                          style: TextStyle(
                            color: Colors.grey[350],
                          )),
                      onPressed: () {
                        print('Pressed');
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(100, 50),
                        primary: Colors.white.withOpacity(0.2),
                        shape: StadiumBorder(),
                      ),
                    )),
                Spacer(),
                Positioned(
                    top: 30,
                    right: 30,
                    child: ElevatedButton.icon(
                      icon: Icon(
                        FontAwesomeIcons.angleDown,
                        color: Colors.grey[350],
                        size: 12.0,
                      ),
                      // ignore: prefer_const_constructors
                      label: Text("Repair",
                          style: TextStyle(
                            color: Colors.grey[350],
                          )),
                      onPressed: () {
                        print('Pressed');
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(100, 50),
                        primary: Colors.white.withOpacity(0.2),
                        shape: StadiumBorder(),
                      ),
                    )),
                Positioned(
                    bottom: 30,
                    right: 30,
                    child: ElevatedButton.icon(
                      icon: Icon(
                        FontAwesomeIcons.angleUp,
                        color: Colors.grey[350],
                        size: 12.0,
                      ),
                      // ignore: prefer_const_constructors
                      label: Text("Petrol Pump",
                          style: TextStyle(
                            color: Colors.grey[350],
                          )),
                      onPressed: () {
                        print('Pressed');
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(100, 50),
                        primary: Colors.white.withOpacity(0.2),
                        shape: StadiumBorder(),
                      ),
                    ))
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.only(left: 20),
            child: Text(
              "Mingles Gas Station",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: RichText(
              text: TextSpan(
                children: [
                  WidgetSpan(
                    child: RatingBar.builder(
                      itemSize: 18,
                      initialRating: 3,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star_rate_rounded,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                  ),
                  TextSpan(
                    text: "4.8",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  TextSpan(
                    text: " 21 reviews",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[400]),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: RichText(
              text: TextSpan(
                children: [
                  WidgetSpan(
                    child: Icon(
                      Icons.local_gas_station_sharp,
                      color: Colors.grey[800],
                    ),
                  ),
                  TextSpan(
                    text: " Location",
                    style: TextStyle(fontSize: 18, color: Colors.grey[800]),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            margin: EdgeInsets.only(left: 20),
            child: Text(
              "Beirut Arab University",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87),
            ),
          ),
          SizedBox(height: 20),
          Row(
            //mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                margin: EdgeInsets.only(left: 20),
                width: 170,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(30),
                  // border: Border.all(
                  // ),
                ),
                child: Center(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "  Distance\n",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey[800],
                          ),
                        ),
                        TextSpan(
                          text: "3.1 KM",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 30,
              ),
              Container(
                width: 170,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(30),
                  // border: Border.all(
                  // ),
                ),
                child: Center(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "   Opening\n",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey[800],
                          ),
                        ),
                        TextSpan(
                          text: "24 hours",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {},
              child: RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: "Open mini map ",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                WidgetSpan(
                  child: Icon(
                    FontAwesomeIcons.truckArrowRight,
                    size: 14,
                    color: Colors.black87,
                  ),
                ),
              ])),
              style: ElevatedButton.styleFrom(
                  primary: Colors.yellow[300],
                  fixedSize: const Size(360, 60),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
          ),
        ],
      )),
    );
  }
}
