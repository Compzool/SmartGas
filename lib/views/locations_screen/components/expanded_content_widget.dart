import 'package:flutter/material.dart';
import 'package:smartgas/services/locations.dart';
import 'package:smartgas/models/location.dart';
import 'package:smartgas/views/locations_screen/components/stars_widget.dart';

class ExpandedContentWidget extends StatelessWidget {
  final Location location;

  const ExpandedContentWidget({
    required this.location,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(location.addressLine1),
            SizedBox(height: 8),
            buildAddressRating(location: location, context: context),
            SizedBox(height: 12),
          ],
        ),
      );

  Widget buildAddressRating({
    required Location location,
    required BuildContext context,
  }) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildReview(location: location, context: context),
          StarsWidget(stars: location.starRating),
        ],
      );

  Widget buildReview({
    required Location location,
    required BuildContext context,
  }) =>
      Row(
        children: location.reviews
            .map((review) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: CircleAvatar(
                    radius: MediaQuery.of(context).size.width * 0.035,
                    backgroundColor: Colors.black12,
                    backgroundImage: AssetImage(review.urlImage),
                  ),
                ))
            .toList(),
      );
}
