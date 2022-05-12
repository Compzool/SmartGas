import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartgas/views/gas_station/components/glassmorphism.dart';

import '../../services/location_service.dart';

class DiscoverStation extends StatelessWidget {
  const DiscoverStation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      //extendBody: false,
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              "assets/images/Lebanon.jpg",
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                const SizedBox(
                  height: 20.0,
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Glassmorphism(
                            blur: 15,
                            opacity: 0.2,
                            radius: 20,
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: " Nearby Gas Stations: ",
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white.withOpacity(0.8)),
                                  ),
                                  TextSpan(
                                    text: " 3 ",
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white.withOpacity(0.8)),
                                  ),
                                  WidgetSpan(
                                    child: Icon(
                                      Icons.local_gas_station_sharp,
                                      color:
                                          Colors.greenAccent.withOpacity(0.8),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
                // Glassmorphism(
                //   blur: 15,
                //   opacity: 0.2,
                //   radius: 20,
                //   child: Container(
                //     width: width * 0.9,
                //     height: height * 0.01,
                //     child: Divider(
                //       color: Colors.transparent,
                //       thickness: 2,
                //     ),
                //   ),
                // ),
                const Spacer(),
                // Build Widget Glassmorphism
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Glassmorphism(
                    blur: 15,
                    opacity: 0.2,
                    radius: 20,
                    child: Container(
                      height: 200,
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          const Text(
                            'Explore and Discover',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Search for the best station for you',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: 16.0,
                            ),
                          ),
                          const Spacer(),
                          Glassmorphism(
                            blur: 20,
                            opacity: 0.1,
                            radius: 50.0,
                            child: TextButton(
                              onPressed: () {
                                // handle push to HomeScreen
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 20,
                                  horizontal: 20,
                                ),
                                child: GestureDetector(
                                  onTap: () =>
                                      EnterMap.launchMap("Gas Station"),
                                  child: const Text(
                                    'Enter Map Now',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
