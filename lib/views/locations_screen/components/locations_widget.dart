import 'package:flutter/material.dart';
import 'package:smartgas/services/locations.dart';


import 'location_widget.dart';

class LocationsWidget extends StatefulWidget {
  const LocationsWidget({Key? key}) : super(key: key);

  @override
  _LocationsWidgetState createState() => _LocationsWidgetState();
}

class _LocationsWidgetState extends State<LocationsWidget> {
  final pageController = PageController(viewportFraction: 0.8);
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: pageController,
              itemCount: locations.length,
              itemBuilder: (context, index) {
                final location = locations[index];

                return LocationWidget(location: location,index: index,);
              },
              onPageChanged: (index) => setState(() => pageIndex = index),
            ),
          ),
          Text(
            '${pageIndex + 1}/${locations.length}',
            style: TextStyle(color: Colors.white70),
          ),
          SizedBox(height: 12)
        ],
      );
}
