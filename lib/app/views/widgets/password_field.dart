import 'package:flutter/material.dart';
import 'package:rockapp/app/styles/colors.dart';
import 'package:rockapp/app/styles/validation.dart';
import 'package:rockapp/core/constant/constant.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({
    Key? key,
    required this.controller,
    required this.hintText,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        hintText: hintText,
        isDense: true,
        hintStyle: const TextStyle(
          fontFamily: AppFonts.poppins,
          fontWeight: FontWeight.w400,
          color: AppColors.lighterAsh,
          fontSize: 13,
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.lowerHome,
            width: 1,
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.lowerHome,
            width: 2,
          ),
        ),
        border: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.lowerHome,
          ),
        ),
      ),
      validator: validatePassword,
    );
  }
}
