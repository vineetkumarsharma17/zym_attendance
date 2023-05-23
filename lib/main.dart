import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:oktoast/oktoast.dart';
import 'package:zym_attendance/constants/theme.dart';
import 'package:zym_attendance/controller/binding.dart';
import 'package:zym_attendance/screens/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    OKToast(
      child: GetMaterialApp(
        theme: ThemeClass.lightTheme,
        debugShowCheckedModeBanner: false,
        initialBinding: AllBinding(),
        home: SplashScreen(),
        defaultTransition: Transition.fadeIn,
        themeMode: ThemeMode.light,
      ),
    ),
  );
}
