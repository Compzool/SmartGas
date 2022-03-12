import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:smartgas/colors/colors.dart';
import 'package:smartgas/pages/home_page.dart';
import 'package:smartgas/pages/testing.dart';
import 'package:smartgas/pages/welcome_page.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController{
  static AuthController instance = Get.find();
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;
  GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
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
        await auth.signInWithEmailAndPassword(email: email, password: password);

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
    final User? user = (await auth.signInWithCredential(credential).then((value) => Get.offAll(TestingPage())));  //if credential success, then using _auth signed in user data will be stored 
 }
  void Logout() async{
    await auth.signOut();
    await googleSignIn.disconnect();
  }
}  