import 'package:flutter/material.dart';
import 'package:rockapp/app/styles/colors.dart';

class DecoratedTextField extends StatelessWidget {
  const DecoratedTextField({
    Key? key,
    required TextEditingController nameController,
    required this.hintText,
    required this.validation,
    this.keyboardType = TextInputType.name,
  })  : _nameController = nameController,
        super(key: key);

  final TextEditingController _nameController;
  final String hintText;
  final FormFieldValidator<String> validation;
  final TextInputType keyboardType;

  String? validateText(value) {
    value = value!.trim();
    if (value.isEmpty) {
      return "Required*";
    }
    return null;
  }

  String? validaEmail(value) {
    value = value!.trim();
    if (value.isEmpty) {
      return "Required*";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 51,
          decoration: const BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(6),
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.inputBox,
                blurRadius: 8,
                spreadRadius: 0,
                offset: Offset(0, 3),
              )
            ],
          ),
        ),
        TextFormField(
          controller: _nameController,
          keyboardType: keyboardType,
          validator: validation,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(
              left: 11,
              top: 18,
              bottom: 15,
            ),
            hintText: hintText,
            border: InputBorder.none,
            hintStyle: const TextStyle(
              color: AppColors.hintTextColor,
              fontWeight: FontWeight.w400,
              fontSize: 10,
            ),
          ),
        ),
      ],
    );
  }
}
