import 'package:smartgas/models/review.dart';

class Location {
  final String name;
  final String urlImage;
  final String latitude;
  final String longitude;
  final String addressLine1;
  final int starRating;
  final List<Review> reviews;

  Location({
    required this.reviews,
    required this.name,
    required this.urlImage,
    required this.latitude,
    required this.longitude,
    required this.addressLine1,
    required this.starRating,
  });
}
