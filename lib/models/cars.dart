

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CarModel {
  String? carId;
  final String car;
  final String model;
  final String licensePlate;
  final String driversLicense;
  int? color;
  CarModel(
      {required this.car,
      required this.model,
      required this.licensePlate,
      required this.driversLicense,
      this.color,
      this.carId});

  Map<String, dynamic> toJson() => {
        'car': car,
        'model': model,
        'licensePlate': licensePlate,
        'driversLicense': driversLicense,
        'color': color,
        'carId': carId,
      };
      
  static CarModel fromJson(Map<String, dynamic> json,String id) => CarModel(
        car: json['car'],
        model: json['model'],
        licensePlate: json['licensePlate'],
        driversLicense: json['driversLicense'],
        color: json['color'],
        carId:  id,
      );
}
