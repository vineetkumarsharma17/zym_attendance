import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:zym_attendance/constants/theme.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:zym_attendance/controller/authController.dart';
import 'package:zym_attendance/widgets/toast.dart';
import '../../widgets/alertBox.dart';
import '../../widgets/bottomBar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isSubmitted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomTabBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(25),
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Image.asset(
                      "assets/images/running.webp",
                      height: 300,
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      "Welcome",
                      style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    if (isSubmitted == false)
                      Text(
                        "Please scan the QR code to mark your attendance",
                        style: TextStyle(
                            color: AppColors.primary,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                    if (isSubmitted == true)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: RichText(
                                text: TextSpan(
                                    text: "Congratulations! \n",
                                    style: AppTextStyle.h1.copyWith(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 30,
                                        color: Colors.black),
                                    children: [
                                  TextSpan(
                                    text:
                                        "Your today's attendance submitted successfully.\n",
                                    style: AppTextStyle.h1.copyWith(
                                        fontSize: 30,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.heading),
                                  ),
                                  TextSpan(
                                    text: "Keep it up!",
                                    style: AppTextStyle.text.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                ])),
                          ),
                        ],
                      ),
                  ],
                )
              ],
            ),
          ),
          UnconstrainedBox(
              child: Container(
            margin: EdgeInsets.all(10),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(100)),
            child: GestureDetector(
              onTap: () => scanCode(),
              child: const Row(children: [
                Icon(
                  Icons.qr_code_scanner_sharp,
                  color: Colors.white,
                ),
                Text(
                  "Scan",
                  style: TextStyle(color: Colors.white),
                )
              ]),
            ),
          )),
        ],
      ),
    );
  }

  void scanCode() async {
    final hasPermission = await _handleLocationPermission();
    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) async {
      log(position.toString());
      await placemarkFromCoordinates(position.latitude, position.longitude)
          .then((placeMarks) async {
        String? name = placeMarks.first.name;
        String? subLocality = placeMarks.first.subLocality;
        String? locality = placeMarks.first.locality;
        String? postalCode = placeMarks.first.postalCode;
        String? state = placeMarks.first.administrativeArea;

        String? cameraScanResult = await scanner.scan();
        if (cameraScanResult != null) {
          setState(() {
            isSubmitted = true;
          });
        }
      });
    }).catchError((e) {
      debugPrint(e.toString());
    });
  }

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        showToastMessage("'Location permissions are denied'");
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      showAlertBox("Permission Required!",
          "You need to allow permission for a better experience.", () {
        openAppSettings();
      }, cancelText: "Close", confirmText: "Open Setting");
      return false;
    }
    return true;
  }
}
