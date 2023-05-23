import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:zym_attendance/screens/auth/auth.dart';
import 'package:zym_attendance/screens/auth/login.dart';
import 'package:zym_attendance/screens/home/home.dart';

import '../widgets/show_loading.dart';
import '../widgets/toast.dart';

AuthController authController = AuthController.instance;
FirebaseAuth auth = FirebaseAuth.instance;

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  init() {
    auth.userChanges().listen((user) {
      if (user == null) {
        Get.offAll(() => const AuthScreen());
      } else {
        log("User: ${user}");
        Get.offAll(() => const HomeScreen());
      }
    });
  }

  loginWithEmail(String email, String password) async {
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        dismissLoadingWidget();
        showToastMessage("Login Successful");
      }).onError((e, stackTrace) {
        dismissLoadingWidget();
        if (e is FirebaseAuthException) {
          showToastMessage(e.message!);
        }
      });
    } catch (e) {
      dismissLoadingWidget();
      showToastMessage(e.toString());
      log(e.toString());
    }
  }

  void signInWithGoogle() async {
    try {
      showLoading("Please wait...");
      GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken);
      await auth.signInWithCredential(credential).then((value) {
        dismissLoadingWidget();
        showToastMessage("Login Successful");
      }).onError((e, stackTrace) {
        dismissLoadingWidget();
        if (e is FirebaseAuthException) {
          showToastMessage(e.message!);
        }
      });
    } catch (e) {
      dismissLoadingWidget();
      showToastMessage(e.toString());
      log(e.toString());
    }
  }
}
