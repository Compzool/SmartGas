import 'package:cloud_firestore/cloud_firestore.dart';

class SmartUser{
   String? uid;
   String? email;
   String? fullName;
   String? phoneNumber;
   String? address;

  SmartUser({ this.uid,
   this.email,
   this.fullName,
   this.phoneNumber,
   this.address,
  });

  SmartUser.fromDocumentSnapshot(DocumentSnapshot doc){
    uid = doc.id;
    email = doc["email"];
    fullName = doc["fullName"];
    phoneNumber = doc["phone"];
    address = doc["address"];
    
  }

}