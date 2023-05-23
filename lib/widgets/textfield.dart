import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/theme.dart';

class AppTextField extends StatefulWidget {
  AppTextField(
      {required this.ctrl,
      // required this.label,
      this.hint,
      this.validator,
      this.isPassword,
      this.maxLines,
      this.inputType,
      this.focus,
      this.action,
      this.autofocus,
      this.onFieldSubmitted,
      this.capitalization,
      this.autofillHints,
      this.onEditingComplete,
      this.onChanged,
      this.onTap,
      this.isDisabled,
      this.suffixIcon,
      this.inputFormatters,
      this.enableInteractiveSelection,
      this.obscureText,
      this.toolbarOptions,
      this.isError});
  TextInputAction? action;
  final TextEditingController ctrl;
  final String? hint;
  final bool? isPassword;
  final bool? isDisabled;

  final int? maxLines;
  List<TextInputFormatter>? inputFormatters;
  final Widget? suffixIcon;
  final TextInputType? inputType;
  final FocusNode? focus;
  final bool? autofocus;

  final List<String>? autofillHints;
  // final String? label;
  final String? Function(String?)? validator;
  final Function()? onTap;
  final Function(String)? onFieldSubmitted;
  final Function(String)? onChanged;
  final Function()? onEditingComplete;
  TextCapitalization? capitalization;
  final bool? enableInteractiveSelection;
  final ToolbarOptions? toolbarOptions;
  bool? isError;
  bool? obscureText;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    // log("error ${widget.isError}");
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
        focusNode: widget.focus,
        controller: widget.ctrl,
        autofocus: widget.autofocus ?? false,
        validator: widget.validator,
        onTap: widget.onTap,
        autofillHints: widget.autofillHints,
        obscureText: widget.obscureText ??
            (widget.isPassword == null ? false : !_passwordVisible),
        maxLines: widget.maxLines ?? 1,
        keyboardType: widget.inputType,
        textCapitalization:
            widget.capitalization ?? TextCapitalization.sentences,
        onEditingComplete: widget.onEditingComplete,
        onFieldSubmitted: widget.onFieldSubmitted,
        onChanged: widget.onChanged,
        inputFormatters: widget.inputFormatters,
        enableInteractiveSelection: widget.enableInteractiveSelection ?? true,
        toolbarOptions: widget.toolbarOptions ??
            ToolbarOptions(
              copy: true,
              cut: true,
              paste: true,
              selectAll: true,
            ),
        decoration: InputDecoration(
          filled: true,

          enabled: widget.isDisabled != true,
          fillColor: Colors.white,
          hintStyle: AppTextStyle.text.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.textHintColor,
              fontSize: 12),
          // labelText: label,
          hintText: widget.hint,
          contentPadding: widget.maxLines != null
              ? EdgeInsets.symmetric(horizontal: 10, vertical: 10)
              : EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          suffixIcon: widget.isPassword != null && widget.isPassword!
              ? IconButton(
                  icon: Icon(
                    // Based on passwordVisible state choose the icon
                    _passwordVisible ? Icons.visibility : Icons.visibility_off,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    // Update the state i.e. toogle the state of passwordVisible variable
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                )
              : widget.suffixIcon != null
                  ? widget.suffixIcon
                  : null,
          border: OutlineInputBorder(
            borderSide: BorderSide(
                color: widget.isError == true
                    ? Colors.red.shade200
                    : AppColors.textFieldBorder,
                width: 1.0),
            borderRadius: BorderRadius.circular(5),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: widget.isError == true
                    ? Colors.red.shade200
                    : AppColors.textFieldBorder,
                width: 1.0),
            borderRadius: BorderRadius.circular(5),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primary, width: 1.0),
            borderRadius: BorderRadius.circular(5),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
                color: widget.isError == true
                    ? Colors.red.shade200
                    : AppColors.textFieldBorder,
                width: 1.0),
          ),
        ),
      ),
    );
  }
}
