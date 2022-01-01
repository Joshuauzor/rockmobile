import 'package:flutter/material.dart';
import 'package:rockapp/app/styles/colors.dart';
import 'package:rockapp/app/styles/touchable_opacity.dart';

import 'loader.dart';

class NextButton extends StatelessWidget {
  const NextButton({
    required this.label,
    required this.onPressed,
    this.disabled = false,
    this.busy = false,
    Key? key,
  }) : super(key: key);

  final String label;
  final VoidCallback onPressed;
  final bool disabled;
  final bool busy;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: disabled ? AppColors.grey : AppColors.primaryColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.5),
          topRight: Radius.circular(20.5),
          bottomLeft: Radius.circular(20.5),
          bottomRight: Radius.circular(20.5),
        ),
        boxShadow: const [
          BoxShadow(
            blurRadius: 8,
            offset: Offset(0, 4),
            spreadRadius: 0,
            color: Color(0x408163D6),
          ),
        ],
      ),
      child: TouchableOpacity(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 13),
          child: busy
              ? const Loader()
              : Text(
                  label,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: AppColors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
        ),
        onTap: onPressed,
      ),
    );
  }
}
