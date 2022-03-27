import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:smartgas/colors/colors.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:smartgas/controllers/location_controller.dart';
import 'package:smartgas/controllers/userController.dart';
import 'package:smartgas/models/user.dart';
import 'package:smartgas/services/database.dart';
import 'package:smartgas/views/complete_profile/complete_profile_screen.dart';
import 'package:smartgas/views/login_success/login_success_screen.dart';
import 'package:smartgas/views/sign_in/sign_in_screen.dart';
import 'package:smartgas/views/welcome/liquid_welcome.dart';

class AuthController extends GetxController{
  static AuthController instance = Get.find();
  UserController userController = Get.put(UserController());
  SmartUser? _currentUser;
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;
  bool isVerified = false;
  Timer? timer;
  GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email','https://www.googleapis.com/auth/contacts.readonly','https://www.googleapis.com/auth/userinfo.profile']);
  @override
  void onReady(){
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.userChanges()); 
    // _currentUser?.uid = auth.currentUser!.uid;
    // _currentUser?.email = (auth.currentUser!.email).toString();
    ever(_user, _initialScreen);
  }

  _initialScreen(User? user) async{
    if(user == null){
      print("Greetings Page");
      Get.offAll(() => GreetingPage());
    }else{
       
       //Get.offAll(() => LoginSuccessScreen());
       

      //   if (user != null && !user.emailVerified) {
      //       await user.sendEmailVerification();
      //       Get.snackbar("Verifcation", "User message",
      // backgroundColor: Color(0xFFECCB45),
      // titleText:  Text("Please Verify your email before you proceed",
      // style: TextStyle(color: Colors.black),));

      // timer = Timer.periodic(Duration(seconds: 3), (_) => checkEmailVerified());
// }
     
    }
  }
  
  // Future checkEmailVerified() async{
  //   await auth.currentUser!.reload();
  //   isVerified = auth.currentUser!.emailVerified;
  //   if(isVerified){
  //     timer?.cancel();
  //     Get.offAll(() => CompleteProfileScreen());
  //     //timer?.cancel();
      
  //   }

  // }
// @override
//   void dispose(){
//     timer?.cancel();
//     super.dispose();
//   }
  void register(String email, String password,String fullName, String phoneNumber,String address) async{
    try {
        UserCredential _authResult =  await auth.createUserWithEmailAndPassword(email: email, password: password);

        SmartUser _user = SmartUser(
        uid: _authResult.user!.uid,
        fullName: fullName,
        email: email,
        phoneNumber: phoneNumber,
        address: address,
        );
        if (await Database().createNewUser(_user)) {
        userController.user = _user;
        Get.off(()=>SignInScreen());
      }

    }catch(e){
      
      Get.snackbar("About User", "User message",
      backgroundColor: Color(0xFFECCB45),
      titleText:  Text("Account creation failed",
      style: TextStyle(color: Colors.black),),
      messageText: 
      Text(e.toString(),
      style: TextStyle(
        color: Colors.black,
      ),),
      );
    }
  }
  void Login(String email, String password) async{
    try {
        UserCredential _authResult = await auth.signInWithEmailAndPassword(email: email, password: password);
         userController.user =
          await Database().getUser(_authResult.user!.uid);

    }catch(e){
      
      Get.snackbar("About Login", "Login message",
      backgroundColor:Color(0xFFECCB45),
      titleText:  Text("Account Login failed",
      style: TextStyle(color: Colors.black),),
      messageText: 
      Text(e.toString(),
      style: TextStyle(
        color: Colors.black,
      ),),
      );
    }
  }
  Future resetPassword(String email) async{
    try{
      await auth.sendPasswordResetEmail(email: email);
      Get.snackbar("About Reset", "Reset",
        backgroundColor:Color(0xFFECCB45),
        titleText:  Text("Reset email sent",
        style: TextStyle(color: Colors.black),)
        );

  }on FirebaseAuthException catch(e){
      Get.snackbar("About Reset", "Failed Request",
      backgroundColor:Color(0xFFECCB45),
      titleText:  Text("Reset email not sent",
      style: TextStyle(color: Colors.black),),
      messageText: 
      Text(e.toString(),
      style: TextStyle(
        color: Colors.black,
      ),),
      );
    }
  }
     //initialization with scope as Email
Future<User?> google_signIn() async{
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();  //calling signIn method // this will open a dialog pop where user can select his email id to signin to the app
    final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;  
    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,                                           //create a login credential
      accessToken: googleAuth.accessToken
    );
    
    final UserCredential _authResult = await auth.signInWithCredential(credential);  //if credential success, then using _auth signed in user data will be stored 
    SmartUser _user = SmartUser(
        uid: _authResult.user!.uid,
        fullName: _authResult.user!.displayName,
        email:_authResult.user!.email,
        phoneNumber: _authResult.user!.phoneNumber,
        address: LocationController.instance.address.value
        );
        
        if (await Database().createNewUser(_user)) {
        userController.user = _user;
        Get.off(()=>LoginSuccessScreen());
      }

 }
  void Logout() async{
    await auth.signOut();
    await googleSignIn.disconnect();
    userController.clear();
  }
}  