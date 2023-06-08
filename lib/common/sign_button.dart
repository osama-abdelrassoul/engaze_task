import 'package:flutter/material.dart';

class SignButton extends StatelessWidget {
  final Widget child;
  const SignButton({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width / 9,
      width: MediaQuery.of(context).size.width / 2.4,
      padding: const EdgeInsets.symmetric(horizontal: 13),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50), color: Colors.blueAccent),
      child: child,
    );
  }
}
