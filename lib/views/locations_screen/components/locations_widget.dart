import 'package:flutter/material.dart';
import 'package:smartgas/controllers/location_controller.dart';
import 'package:smartgas/services/locations.dart';
import 'dart:math' show cos, sqrt, asin;
import 'location_widget.dart';

class LocationsWidget extends StatefulWidget {
  LocationsWidget({Key? key}) : super(key: key);

  @override
  _LocationsWidgetState createState() => _LocationsWidgetState();
}

void calculateDistance(double lat1, double lng1, String lat2, String lng2) {
  double dlat = double.parse(lat2);
  double dlng = double.parse(lng2);
  var p = 0.017453292519943295;
  var c = cos;
  var a = 0.5 -
      c((dlat - lat1) * p) / 2 +
      c(lat1 * p) * c(dlat * p) * (1 - c((dlng - lng1) * p)) / 2;
  debugPrint("THE DISTANCE TO LOCATIONS IS : ${12742 * asin(sqrt(a))}");
}

class _LocationsWidgetState extends State<LocationsWidget> {
  final pageController = PageController(viewportFraction: 0.8);
  int pageIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    calculateDistance(
        LocationController.instance.Map1,
        LocationController.instance.Map2,
        locations[0].latitude.toString(),
        locations[0].longitude.toString());
  }

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: pageController,
              itemCount: locations.length,
              itemBuilder: (context, index) {
                final location = locations[index];

                return LocationWidget(
                  location: location,
                  index: index,
                );
              },
              onPageChanged: (index) => setState(() => pageIndex = index),
            ),
          ),
          // Text(
          //   '${pageIndex + 1}/${locations.length}',
          //   style: TextStyle(color: Colors.white70),
          // ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
        ],
      );
}
