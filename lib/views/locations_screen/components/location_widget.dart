import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartgas/models/location.dart';
import 'package:smartgas/views/gas_station/components/gas_station_details.dart';
import 'package:smartgas/views/locations_screen/components/expanded_content_widget.dart';
import 'package:smartgas/views/locations_screen/components/image_widget.dart';

class LocationWidget extends StatefulWidget {
  final Location location;
  final int index;
  final double distance;
  const LocationWidget(
      {Key? key,
      required this.distance,
      required this.location,
      required this.index})
      : super(key: key);

  @override
  _LocationWidgetState createState() => _LocationWidgetState();
}

class _LocationWidgetState extends State<LocationWidget> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedPositioned(
            duration: Duration(milliseconds: 500),
            bottom: isExpanded ? 40 : 100,
            width: isExpanded ? size.width * 0.82 : size.width * 0.74,
            height: isExpanded ? size.height * 0.6 : size.height * 0.5,
            child: ExpandedContentWidget(location: widget.location),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 500),
            bottom: isExpanded ? 150 : 100,
            child: GestureDetector(
              onPanUpdate: onPanUpdate,
              onTap: () {
                Get.to(
                    () => GasDetails(
                        location: widget.location, index: widget.index, distance: widget.distance),
                    transition: Transition.fade);
              },
              child: ImageWidget(location: widget.location),
            ),
          ),
        ],
      ),
    );
  }

  void onPanUpdate(DragUpdateDetails details) {
    if (details.delta.dy < 0) {
      setState(() {
        isExpanded = true;
      });
    } else if (details.delta.dy > 0) {
      setState(() {
        isExpanded = false;
      });
    }
  }
}
