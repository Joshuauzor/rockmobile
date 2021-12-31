import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rockapp/app/styles/colors.dart';

class Loader extends StatelessWidget {
  final Color color;
  final double size, strokeWidth;

  const Loader({
    Key? key,
    this.color = AppColors.grey,
    this.size = 20,
    this.strokeWidth = 2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: Platform.isIOS
          ? const CupertinoActivityIndicator(
              radius: 15,
            )
          : CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(color),
            ),
    );
  }
}
