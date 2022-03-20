import 'package:cloud_firestore/cloud_firestore.dart';

class SmartUser{
  late String uid;
  late String email;
  late String firstName;
  late String lastName;
  late String phoneNumber;
  late String address;
  late Timestamp accountCreated;

  SmartUser({required this.uid,
  required this.email,
  required this.firstName,
  required this.lastName,
  required this.phoneNumber,
  required this.address,
  required this.accountCreated,
  });

}