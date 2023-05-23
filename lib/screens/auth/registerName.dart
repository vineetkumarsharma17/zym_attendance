import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zym_attendance/widgets/widgetFunction.dart';

import '../../constants/theme.dart';
import '../../widgets/textfield.dart';

class RegisterProfileScreen extends StatelessWidget {
  RegisterProfileScreen({Key? key}) : super(key: key);
  TextEditingController firstNameCtrl = TextEditingController();
  TextEditingController lastNameCtrl = TextEditingController();
  TextEditingController phoneCtrl = TextEditingController();

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
                            text: "Register ",
                            style: AppTextStyle.h1.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 30,
                                color: Colors.black),
                            children: [
                          TextSpan(
                            text: "Profile \n",
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
                "First Name",
              ),
              AppTextField(
                ctrl: firstNameCtrl,
                hint: "Enter Your First Name",
                capitalization: TextCapitalization.words,
              ),
              buildTextFieldLabel(
                "Last Name",
              ),
              AppTextField(
                ctrl: lastNameCtrl,
                hint: "Enter Your Last Name",
                capitalization: TextCapitalization.words,
              ),
              buildTextFieldLabel(
                "Contact Number",
              ),
              AppTextField(
                ctrl: phoneCtrl,
                hint: "Enter Your Contact Number",
                inputType: TextInputType.phone,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(10),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
