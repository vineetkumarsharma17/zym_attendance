import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zym_attendance/screens/home/home.dart';

import '../constants/theme.dart';
import '../screens/home/profile.dart';

class BottomTabBar extends StatefulWidget {
  BottomTabBar({Key? key}) : super(key: key);

  @override
  State<BottomTabBar> createState() => _BottomTabBarState();
}

class _BottomTabBarState extends State<BottomTabBar> {
  int _cI = 0;
  @override
  Widget build(BuildContext context) {
    log(ModalRoute.of(context)?.settings.name ?? "");

    switch (ModalRoute.of(context)?.settings.name) {
      case "/HomeScreen":
        _cI = 0;
        break;
      case "/ProfileScreen":
        _cI = 1;

        break;

      default:
        _cI = 0;
    }
    // log("ci:" + _cI.toString());
    return Container(
      height: 80,
      padding: EdgeInsets.all(3),
      // margin: EdgeInsets.only(bottom: 3),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(1, 1), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                if (_cI != 0) {
                  setState(() {
                    _cI = 0;
                  });
                  Get.offAll(() => const HomeScreen());
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  color: _cI == 0
                      ? Color.fromARGB(255, 204, 218, 243)
                      : Colors.white,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.home,
                      color: AppColors.primary,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Home",
                      style: AppTextStyle.text
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                if (_cI != 1) {
                  setState(() {
                    _cI = 1;
                  });
                  Get.offAll(() => const ProfileScreen());
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  color: _cI == 1
                      ? Color.fromARGB(255, 204, 218, 243)
                      : Colors.white,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.person,
                      color: AppColors.primary,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Profile",
                      style: AppTextStyle.text
                          .copyWith(fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
