import 'package:smartgas/controllers/location_controller.dart';
import 'package:smartgas/services/reviews.dart';
import 'package:smartgas/models/location.dart';

List<Location> locations = [
  Location(
    name: 'Total',
    urlImage: 'assets/images/aliawadstation1.jpg',
    addressLine1: 'HP8C+4J4, Qaraoun',
    starRating: 4,
    // latitude: 'NORTH LAT 33',
    // longitude: 'EAST LNG 35',
    reviews: Reviews.allReviews,
    latitude: '33.565474',
    longitude: '35.721542',
  ),
  Location(
    name: 'Phoenica',
    urlImage: 'assets/images/moktar.jpg',
    addressLine1: 'HP89+94, Qaraoun',
    starRating: 3,
    latitude: '33.566264',
    longitude: '35.717854',
    reviews: Reviews.allReviews,
  ),
  Location(
    name: 'Total',
    urlImage: 'assets/images/aliawadstation2.jpg',
    addressLine1: 'HP9C+MH Qaraoun',
    starRating: 5,
    latitude: '33.5695754',
    longitude: '35.721399',
    reviews: Reviews.allReviews,
  ),
];
