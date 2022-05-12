import 'package:smartgas/controllers/location_controller.dart';
import 'package:smartgas/services/reviews.dart';
import 'package:smartgas/models/location.dart';

List<Location> locations = [
  Location(
    name: 'Medco',
    urlImage: 'assets/images/medco.jpg',
    addressLine1: 'MFGJ+G28، دبية',
    starRating: 4,
    // latitude: 'NORTH LAT 33',
    // longitude: 'EAST LNG 35',
    reviews: Reviews.allReviews,
    latitude:'33.6762753',
    longitude:'35.4800875',
  ),
  Location(
    name: 'IPT',
    urlImage: 'assets/images/IPT.jpg',
    addressLine1: 'MCVH+HFV, Damour',
    starRating: 3,
    latitude: 'NORTH LAT 33',
    longitude: 'EAST LNG 35',
    reviews: Reviews.allReviews,
  ),
  Location(
    name: 'Hypco',
    urlImage: 'assets/images/hypco.png',
    addressLine1: 'MCQH+VJW، سعديات،',
    starRating: 5,
    latitude: '${LocationController.instance.latitude.value}',
    longitude: 'EAST LNG 35',
    reviews: Reviews.allReviews,
  ),
];
