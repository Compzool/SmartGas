import 'package:cloud_firestore/cloud_firestore.dart';

class SmartUser {
  String? id;
  String? ssn;
  String? email;
  String? fullName;
  String? phoneNumber;
  String? address;
  String? pictureUrl;
  String? birthday;

  SmartUser({
    this.id,
    this.ssn,
    this.email,
    this.fullName,
    this.phoneNumber,
    this.address,
    this.pictureUrl,
    this.birthday,
  });
  Map<String, dynamic> toJson() => {
        'id': id,
        'ssn': ssn,
        'name': fullName,
        'email': email,
        'pictureUrl': pictureUrl,
        'phoneNumber': phoneNumber,
        'address': address,
        'birthday': birthday,
      };
  static SmartUser fromJson(Map<String, dynamic> json) => SmartUser(
        id: json['id'],
        ssn: json['ssn'],
        fullName: json['name'],
        email: json['email'],
        pictureUrl: json['pictureUrl'],
        phoneNumber: json['phoneNumber'],
        address: json['address'],
        birthday: json['birthday'],
      );
}
