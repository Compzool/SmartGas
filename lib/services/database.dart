import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smartgas/controllers/userController.dart';
import 'package:smartgas/models/cars.dart';
import 'package:smartgas/models/fill.dart';
import 'package:smartgas/models/user.dart';

class Database {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<bool> createUser(SmartUser user) async {
    try {
      final docUser =
          FirebaseFirestore.instance.collection('users').doc(user.id);
      final json = user.toJson();
      await docUser.set(json);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<SmartUser?> readSingleUser(String id) async {
    //String id
    //final  document = await FirebaseFirestore.instance.collection('users').doc(id).get();
    final docUser =
        await FirebaseFirestore.instance.collection('users').doc(id);
    final snapshot = await docUser.get();

    if (snapshot.exists) {
      final json = snapshot.data()!;
      return SmartUser.fromJson(json);
    }
  }

  // Future<bool> createNewUser(SmartUser user) async {
  //   try {
  //     await _firestore.collection("users").doc(user.uid).set({
  //       "fullName": user.fullName,
  //       "email": user.email,
  //       "phone": user.phoneNumber,
  //       "address": user.address,

  //     });
  //     return true;
  //   } catch (e) {
  //     print(e);
  //     return false;
  //   }
  // }

  // Future<SmartUser> getUser(String uid) async {
  //   try {
  //     DocumentSnapshot _doc =
  //         await _firestore.collection("users").doc(uid).get();

  //     return SmartUser.fromDocumentSnapshot(_doc);
  //   } catch (e) {
  //     print(e);
  //     rethrow;
  //   }
  // }

  Future addCar(CarModel car) async {
    try {
      await _firestore
          .collection("users")
          .doc(UserController.instance.user.id)
          .collection("cars")
          .add({
        "car": car.car,
        "model": car.model,
        "licensePlate": car.licensePlate,
        "driversLicense": car.driversLicense,
        "color": car.color,
      });
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Stream<List<CarModel>> readInfoStream(String id) => FirebaseFirestore.instance
      .collection('users')
      .doc(id)
      .collection('cars')
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map((doc) => CarModel.fromJson(doc.data(), doc.id))
          .toList());

  Stream<List<FillModel>> readFillStream(String id) =>
      FirebaseFirestore.instance
          .collection('users')
          .doc(id)
          .collection('fills')
          .snapshots()
          .map((snapshot) => snapshot.docs
              .map((doc) => FillModel.fromJson(doc.data(), doc.id))
              .toList());

  // Stream<List<CarModel>> todoStream(String uid) {
  //   return _firestore
  //       .collection("users")
  //       .document(uid)
  //       .collection("todos")
  //       .orderBy("dateCreated", descending: true)
  //       .snapshots()
  //       .map((QuerySnapshot query) {
  //     List<CarModel> retVal = [];
  //     query.documents.forEach((element) {
  //       retVal.add(CarModel.fromDocumentSnapshot(element));
  //     });
  //     return retVal;
  //   });
  // }

  // Future<void> updateTodo(bool newValue, String uid, String todoId) async {
  //   try {
  //     _firestore
  //         .collection("users")
  //         .document(uid)
  //         .collection("todos")
  //         .document(todoId)
  //         .updateData({"done": newValue});
  //   } catch (e) {
  //     print(e);
  //     rethrow;
  //   }
  // }
}
