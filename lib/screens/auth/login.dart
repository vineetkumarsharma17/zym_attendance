import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:zym_attendance/constants/theme.dart';
import 'package:zym_attendance/controller/authController.dart';

import '../../widgets/buttons.dart';
import '../../widgets/textfield.dart';
import '../../widgets/widgetFunction.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      padding: const EdgeInsets.all(25),
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      children: [
        SizedBox(
          height: 40,
        ),
        AutofillGroup(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: RichText(
                        text: TextSpan(
                            text: "Log ",
                            style: AppTextStyle.h1.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 30,
                                color: Colors.black),
                            children: [
                          TextSpan(
                            text: "In \n",
                            style: AppTextStyle.h1.copyWith(
                                fontSize: 30,
                                fontWeight: FontWeight.w600,
                                color: AppColors.heading),
                          ),
                          TextSpan(
                            text: "Welcome Back!",
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
                height: 30,
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
                // onEditingComplete: () =>
                //     TextInput.finishAutofillContext(),
              ),
              buildTextFieldLabel(
                "Password",
              ),
              AppTextField(
                ctrl: passCtrl,
                hint: "Enter Your Password",
                // capitalization: TextCapitalization.none,
                autofillHints: [
                  AutofillHints.password,
                ],
                isPassword: true,
                onFieldSubmitted: (_) {
                  FocusManager.instance.primaryFocus?.unfocus();
                  if (Platform.isIOS) TextInput.finishAutofillContext();
                },
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {
                        // Get.toNamed(AppRoutes.forgotPass);
                      },
                      child: Text(
                        "Forgot Password",
                        style: AppTextStyle.text.copyWith(
                            fontSize: 14,
                            decoration: TextDecoration.underline,
                            color: Color.fromARGB(255, 199, 57, 57)),
                      ))
                ],
              ),
              SizedBox(
                height: 30,
              ),
              ButtonWidget(
                  text: "Login",
                  onTap: () {
                    // Get.toNamed(AppRoutes.verifyEmail);
                  }),
              SizedBox(
                height: 20,
              ),
              SignInButton(
                Buttons.GoogleDark,
                text: "Log in with Google",
                onPressed: () {
                  authController.signInWithGoogle();
                },
              )
            ],
          ),
        )
      ],
    ));
  }
}
