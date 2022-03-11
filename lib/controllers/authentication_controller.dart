import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:smartgas/pages/home_page.dart';
import 'package:smartgas/pages/testing.dart';
import 'package:smartgas/pages/welcome_page.dart';

class AuthController extends GetxController{
  static AuthController instance = Get.find();
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady(){
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.userChanges());

    ever(_user, _initialScreen);
  }

  _initialScreen(User? user){
    if(user == null){
      print("Login Page");
      Get.offAll(() => WelcomePage());
    }else{
      Get.offAll(() => TestingPage());
    }
  }

  void register(String email, String password) async{
    try {
        await auth.createUserWithEmailAndPassword(email: email, password: password);

    }catch(e){
      
      Get.snackbar("About User", "User message",
      backgroundColor: Colors.redAccent,
      titleText:  Text("Account creation failed",
      style: TextStyle(color: Colors.white),),
      messageText: 
      Text(e.toString(),
      style: TextStyle(
        color: Colors.white,
      ),),
      );
    }
  }
  void Login(String email, String password) async{
    try {
        await auth.signInWithEmailAndPassword(email: email, password: password);

    }catch(e){
      
      Get.snackbar("About Login", "Login message",
      backgroundColor: Colors.redAccent,
      titleText:  Text("Account Login failed",
      style: TextStyle(color: Colors.white),),
      messageText: 
      Text(e.toString(),
      style: TextStyle(
        color: Colors.white,
      ),),
      );
    }
  }
  void Logout() async{
    await auth.signOut();
  }
}  