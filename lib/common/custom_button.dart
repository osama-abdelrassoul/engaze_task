import 'package:flutter/material.dart';

import 'sign_button.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color? color;
  final VoidCallback onTap;
  const CustomButton(
      {Key? key, required this.text, required this.onTap, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SignButton(
      child: TextButton(
          onPressed: onTap,
          child: Text(
            text,
            style: const TextStyle(color: Colors.black),
          )),
    );
  }
}
