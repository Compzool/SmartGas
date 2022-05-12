// To parse this JSON data, do
//
//     final gasStation = gasStationFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<GasStation>? gasStationFromJson(String str) =>
    List<GasStation>.from(json.decode(str).map((x) => GasStation.fromJson(x)));

class GasStation {
  GasStation({
    required this.title,
    required this.subTitle,
    required this.price,
    required this.menu,
    required this.categoryName,
    required this.address,
    required this.locatedIn,
    required this.neighborhood,
    required this.street,
    required this.city,
    required this.postalCode,
    required this.state,
    required this.countryCode,
    required this.plusCode,
    required this.website,
    required this.phone,
    required this.temporarilyClosed,
    required this.location,
    required this.permanentlyClosed,
    required this.totalScore,
    required this.isAdvertisement,
    required this.rank,
    required this.placeId,
    required this.categories,
    required this.cid,
    required this.url,
    required this.searchPageUrl,
    required this.searchString,
    required this.scrapedAt,
    required this.reviewsCount,
    required this.reviewsDistribution,
    required this.reviews,
    required this.orderBy,
  });

  String? title;
  dynamic subTitle;
  dynamic price;
  dynamic menu;
  String? categoryName;
  String? address;
  dynamic locatedIn;
  String? neighborhood;
  String? street;
  String? city;
  dynamic postalCode;
  dynamic state;
  String? countryCode;
  String? plusCode;
  String? website;
  String? phone;
  bool? temporarilyClosed;
  Location? location;
  bool? permanentlyClosed;
  double? totalScore;
  bool? isAdvertisement;
  int? rank;
  String? placeId;
  List<String>? categories;
  String? cid;
  String? url;
  String? searchPageUrl;
  dynamic searchString;
  DateTime? scrapedAt;
  int? reviewsCount;
  ReviewsDistribution? reviewsDistribution;
  List<dynamic>? reviews;
  List<dynamic>? orderBy;

  factory GasStation.fromJson(Map<String, dynamic> json) => GasStation(
        title: json["title"],
        subTitle: json["subTitle"],
        price: json["price"],
        menu: json["menu"],
        categoryName: json["categoryName"],
        address: json["address"],
        locatedIn: json["locatedIn"],
        neighborhood:
            json["neighborhood"] == null ? null : json["neighborhood"],
        street: json["street"] == null ? null : json["street"],
        city: json["city"] == null ? null : json["city"],
        postalCode: json["postalCode"],
        state: json["state"],
        countryCode: json["countryCode"],
        plusCode: json["plusCode"] == null ? null : json["plusCode"],
        website: json["website"] == null ? null : json["website"],
        phone: json["phone"] == null ? null : json["phone"],
        temporarilyClosed: json["temporarilyClosed"],
        location: Location.fromJson(json["location"]),
        permanentlyClosed: json["permanentlyClosed"],
        totalScore:
            json["totalScore"] == null ? null : json["totalScore"].toDouble(),
        isAdvertisement: json["isAdvertisement"],
        rank: json["rank"],
        placeId: json["placeId"],
        categories: List<String>.from(json["categories"].map((x) => x)),
        cid: json["cid"],
        url: json["url"],
        searchPageUrl: json["searchPageUrl"],
        searchString: json["searchString"],
        scrapedAt: DateTime.parse(json["scrapedAt"]),
        reviewsCount: json["reviewsCount"],
        reviewsDistribution:
            ReviewsDistribution.fromJson(json["reviewsDistribution"]),
        reviews: List<dynamic>.from(json["reviews"].map((x) => x)),
        orderBy: List<dynamic>.from(json["orderBy"].map((x) => x)),
      );
}

class Location {
  Location({
    required this.lat,
    required this.lng,
  });

  double? lat;
  double? lng;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        lat: json["lat"].toDouble(),
        lng: json["lng"].toDouble(),
      );
}

class ReviewsDistribution {
  ReviewsDistribution({
    required this.oneStar,
    required this.twoStar,
    required this.threeStar,
    required this.fourStar,
    required this.fiveStar,
  });

  int? oneStar;
  int? twoStar;
  int? threeStar;
  int? fourStar;
  int? fiveStar;

  factory ReviewsDistribution.fromJson(Map<String, dynamic> json) =>
      ReviewsDistribution(
        oneStar: json["oneStar"],
        twoStar: json["twoStar"],
        threeStar: json["threeStar"],
        fourStar: json["fourStar"],
        fiveStar: json["fiveStar"],
      );
}
