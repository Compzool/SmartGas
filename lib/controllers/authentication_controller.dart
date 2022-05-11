import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_storage/get_storage.dart';
import 'package:smartgas/colors/colors.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:smartgas/controllers/controller_constants.dart';
import 'package:smartgas/controllers/location_controller.dart';
import 'package:smartgas/controllers/userController.dart';
import 'package:smartgas/models/user.dart';
import 'package:smartgas/services/database.dart';
import 'package:smartgas/views/complete_profile/complete_profile_screen.dart';
import 'package:smartgas/views/home_navigator/home_navigator.dart';
import 'package:smartgas/views/login_success/login_success_screen.dart';
import 'package:smartgas/views/sign_in/components/sign_form.dart';
import 'package:smartgas/views/sign_in/sign_in_screen.dart';
import 'package:smartgas/views/welcome/liquid_welcome.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  UserController userController = Get.put(UserController());
  bool isVerified = false;
  Timer? timer;
  // GoogleSignIn googleSignIn = GoogleSignIn(scopes: [
  //   'email',
  //   'https://www.googleapis.com/auth/contacts.readonly',
  //   'https://www.googleapis.com/auth/userinfo.profile'
  // ]);

  late Rx<User?> firebaseUser;
  late Rx<GoogleSignInAccount?> googleSignInAccount;
  late Rx<SmartUser?> userModel;
  User? get userCurrent => firebaseUser.value;
  SmartUser? get userModelCurrent => userModel.value;
  set userModelCurrent(SmartUser? value) => userModel.value = value;
  bool isGoolgeSignIn = false;

  //GetStorage for userlogin
  //final signInStatus = GetStorage();
  // late bool isSignedIn = true;

  @override
  void onInit() {
    // TODO: implement onInit
    //isSignedIn = signInStatus.read('remember');
    //print(signInStatus.read('remember'));

    userModel = SmartUser(
            email: '',
            fullName: '',
            pictureUrl: '',
            address: '',
            phoneNumber: '',
            birthday: '',
            ssn: '')
        .obs;
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    firebaseUser = Rx<User?>(auth.currentUser);
    googleSignInAccount = Rx<GoogleSignInAccount?>(googleSign.currentUser);

    firebaseUser.bindStream(auth.userChanges());
    ever(firebaseUser, _setInitialScreen);

    googleSignInAccount.bindStream(googleSign.onCurrentUserChanged);
    ever(googleSignInAccount, _setInitialScreenGoogle);
  }

  _setInitialScreen(User? user) async {
    if (user == null) {
      print("Greetings Page");
      Get.offAll(() => GreetingPage());
    } else {
      //Get.offAll(() => HomeNavigator());

      if (user != null && !user.emailVerified) {
        await user.sendEmailVerification();
        Get.snackbar("Verifcation", "User message",
            backgroundColor: Color(0xFFECCB45),
            titleText: Text(
              "Please Verify your email before you proceed",
              style: TextStyle(color: Colors.black),
            ));

        timer =
            Timer.periodic(Duration(seconds: 10), (_) => checkEmailVerified());
      } else {
        await Future.delayed(const Duration(seconds: 1), () {Get.offAll(HomeNavigator());});
        
      }
    }
  }

  _setInitialScreenGoogle(GoogleSignInAccount? googleSignInAccount) {
    print(googleSignInAccount);
    if (googleSignInAccount == null) {
      // if the user is not found then the user is navigated to the Register Screen
      Get.offAll(() => GreetingPage());
    } else {
      // if the user exists and logged in the the user is navigated to the Home Screen
      isGoolgeSignIn ? Get.offAll(() => HomeNavigator()) : DoNothingAction();
    }
  }

  Future checkEmailVerified() async {
    await auth.currentUser!.reload();
    isVerified = auth.currentUser!.emailVerified;
    if (isVerified) {
      timer!.cancel();
      Get.offAll(() => HomeNavigator());
      //timer?.cancel();
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void register(
      String email,
      String password,
      String fullName,
      String phoneNumber,
      String address,
      String pictureUrl,
      String ssn,
      String birthday) async {
    try {
      UserCredential authResults = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      //UserModel user = UserModel(fname: fname, lname: lname, email: email, pictureUrl: pictureUrl);
      SmartUser user = SmartUser(
          id: authResults.user!.uid,
          email: email,
          pictureUrl: pictureUrl,
          fullName: fullName,
          ssn: ssn,
          birthday: birthday,
          phoneNumber: phoneNumber,
          address: address);
      if (await Database().createUser(user)) {
        Get.find<UserController>().user = user;
        Get.offAll(() => SignInScreen());
      }
    } catch (e) {
      Get.snackbar(
        "About User",
        "User message",
        backgroundColor: Color(0xFFECCB45),
        titleText: Text(
          "Account creation failed",
          style: TextStyle(color: Colors.black),
        ),
        messageText: Text(
          e.toString(),
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      );
    }
  }

  void login(String email, String password) async {
    try {
      isGoolgeSignIn = false;
      
      UserCredential authResults = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      Get.find<UserController>().user =
          await Database().readSingleUser(authResults.user!.uid) as SmartUser;
    } catch (e) {
      Get.snackbar(
        "About Login",
        "Login message",
        backgroundColor: Color(0xFFECCB45),
        titleText: Text(
          "Account Login failed",
          style: TextStyle(color: Colors.black),
        ),
        messageText: Text(
          e.toString(),
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      );
    }
  }

  Future resetPassword(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      Get.snackbar("About Reset", "Reset",
          backgroundColor: Color(0xFFECCB45),
          titleText: Text(
            "Reset email sent",
            style: TextStyle(color: Colors.black),
          ));
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        "About Reset",
        "Failed Request",
        backgroundColor: Color(0xFFECCB45),
        titleText: Text(
          "Reset email not sent",
          style: TextStyle(color: Colors.black),
        ),
        messageText: Text(
          e.toString(),
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      );
    }
  }

  //initialization with scope as Email
  void signInWithGoogle() async {
    try {
      GoogleSignInAccount? googleSignInAccount = await googleSign.signIn();

      GoogleSignIn _googleSignIn = GoogleSignIn();
      if (googleSignInAccount != null) {
        GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        final result = await FirebaseFirestore.instance
            .collection('users')
            .where('email', isEqualTo: googleSignInAccount.email)
            .get();
        if (result.docs.isEmpty) {
          Get.snackbar(
            "Google Sign in",
            "Failed Request",
            backgroundColor: Color(0xFFECCB45),
            titleText: Text(
              "Please make an account before using google sign in",
              style: TextStyle(color: Colors.black),
            ),
          );
          // _googleSignIn.disconnect();
          // _googleSignIn.signOut();
          return;
        } else {
          isGoolgeSignIn = true;

          userModelCurrent = SmartUser.fromJson(result.docs.first.data());
          Get.find<UserController>().user = await Database()
              .readSingleUser(userModelCurrent!.id!) as SmartUser;
          await auth
              .signInWithCredential(credential)
              .catchError((onErr) => print(onErr));
          _setInitialScreenGoogle(googleSignInAccount);
        }
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
      print(e.toString());
    }
  }

  Future<void> Logout() async {
    isGoolgeSignIn = false;
    Get.find<UserController>().clear();
    await auth.signOut();
    await googleSign.signOut();
    await googleSign.disconnect();
  }
}
