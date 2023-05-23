import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:zym_attendance/screens/auth/login.dart';
import 'package:zym_attendance/widgets/buttons.dart';
import 'package:zym_attendance/widgets/widgetFunction.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import '../../constants/theme.dart';
import '../../widgets/textfield.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passCtrl = TextEditingController();
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
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: RichText(
                        text: TextSpan(
                            text: "Sign ",
                            style: AppTextStyle.h1.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 30,
                                color: Colors.black),
                            children: [
                          TextSpan(
                            text: "Up \n",
                            style: AppTextStyle.h1.copyWith(
                                fontSize: 30,
                                fontWeight: FontWeight.w600,
                                color: AppColors.heading),
                          ),
                          TextSpan(
                            text: "Let's Get Started!",
                            style: AppTextStyle.text.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ])),
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              buildTextFieldLabel(
                "Email Address",
              ),
              AppTextField(
                ctrl: emailCtrl,
                hint: "Enter Your Email Address",
                inputType: TextInputType.emailAddress,
                capitalization: TextCapitalization.none,
                autofillHints: [AutofillHints.email, AutofillHints.username],
              ),
              buildTextFieldLabel(
                "Password",
              ),
              AppTextField(
                ctrl: passCtrl,
                hint: "Enter Your Password",
                autofillHints: [
                  AutofillHints.password,
                ],
                isPassword: true,
              ),
              SizedBox(
                height: 25,
              ),
              ButtonWidget(text: "Sign Up", onTap: () {}),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account? ",
                    style: AppTextStyle.text
                        .copyWith(fontSize: 16, color: AppColors.grey),
                  ),
                  GestureDetector(
                    onTap: () => Get.to(() => const LogInScreen()),
                    child: Text(
                      "Login",
                      style: AppTextStyle.h1
                          .copyWith(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              SignInButton(
                Buttons.GoogleDark,
                text: "Sign up with Google",
                onPressed: () {
                  
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
