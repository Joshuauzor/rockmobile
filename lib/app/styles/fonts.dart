import 'package:flutter/material.dart';

class BodyText extends StatelessWidget {
  const BodyText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Login',
      style: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: Colors.white,
      ),
    );
  }
}
