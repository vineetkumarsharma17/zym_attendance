import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zym_attendance/screens/auth/login.dart';
import 'package:zym_attendance/screens/auth/signup.dart';

import '../../constants/theme.dart';
import '../../widgets/buttons.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(25),
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
              ),
              Image.asset(
                "assets/images/running.webp",
                height: 300,
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Let’s ",
                    style: AppTextStyle.h1.copyWith(fontSize: 24),
                  ),
                  Text(
                    "Get ",
                    style: AppTextStyle.h1.copyWith(
                        fontSize: 24,
                        color: const Color.fromARGB(
                          255,
                          6,
                          44,
                          128,
                        )),
                  ),
                  Text(
                    "Started ",
                    style: AppTextStyle.h1.copyWith(fontSize: 24),
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Your Next Career Move is Waiting",
                  style: AppTextStyle.text.copyWith(
                      color: AppColors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w800),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              ButtonWidget(
                text: "Sign up",
                onTap: (() => Get.to(() => SignUpScreen())),
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account? ",
                    style: AppTextStyle.text.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: AppColors.grey),
                  ),
                  GestureDetector(
                    onTap: (() => Get.to(() => const LogInScreen())),
                    child: Text(
                      "Login",
                      style: AppTextStyle.h1
                          .copyWith(fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
            ],
          )
        ],
      ),
    );
  }
}
