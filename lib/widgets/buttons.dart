import 'package:flutter/material.dart';

import '../constants/theme.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final FontWeight? fontWeight;
  final BorderRadius? borderRadius;
  final Color? bgColor;
  final Color? textColor;
  final Color? borderColor;

  final double? width;
  final Function() onTap;

  ButtonWidget(
      {Key? key,
      required this.text,
      required this.onTap,
      this.bgColor,
      this.fontWeight,
      this.borderRadius,
      this.textColor,
      this.borderColor,
      this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? double.infinity,
        height: 58,
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 30),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
            border:
                borderColor != null ? Border.all(color: borderColor!) : null,
            color: bgColor ?? AppColors.primary,
            borderRadius: borderRadius ?? BorderRadius.circular(40)),
        child: Text(
          text,
          textAlign: TextAlign.left,
          style: AppTextStyle.text.copyWith(
              color: textColor ?? Colors.white,
              fontSize: 16,
              fontWeight: fontWeight ?? FontWeight.w500),
        ),
      ),
    );
  }
}

class OutLineButtonWidget extends StatelessWidget {
  final String text;
  final FontWeight? fontWeight;
  final BorderRadius? borderRadius;
  final Color? bgColor;
  final Color? textColor;
  final Color? borderColor;

  final double? width;
  final Function() onTap;

  OutLineButtonWidget(
      {Key? key,
      required this.text,
      required this.onTap,
      this.bgColor,
      this.fontWeight,
      this.borderRadius,
      this.textColor,
      this.borderColor,
      this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? double.infinity,
        height: 58,
        alignment: Alignment.center,
        // margin: EdgeInsets.symmetric(horizontal: 20),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
            border: Border.all(color: borderColor ?? AppColors.primary),
            color: bgColor ?? Colors.white,
            borderRadius: borderRadius ?? BorderRadius.circular(40)),
        child: Text(
          text,
          textAlign: TextAlign.left,
          style: AppTextStyle.text.copyWith(
              color: textColor ?? Colors.black,
              fontSize: 16,
              fontWeight: fontWeight ?? FontWeight.w500),
        ),
      ),
    );
  }
}
