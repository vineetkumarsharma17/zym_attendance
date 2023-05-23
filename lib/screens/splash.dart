// Create  simple Splash Screen
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../controller/authController.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key) {
    init();
  }
  init() {
    Future.delayed(const Duration(seconds: 3), () {
      authController.init();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/running.webp",
            height: 300,
          ),
          SizedBox(
            height: 20,
          ),
          const SpinKitFoldingCube(color: Colors.blue),
        ],
      )),
    );
  }
}
