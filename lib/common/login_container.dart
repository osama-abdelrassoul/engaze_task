import 'package:flutter/material.dart';

class LoginContainer extends StatelessWidget {
  const LoginContainer({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width / 6,
      width: MediaQuery.of(context).size.width / 1.2,
      padding: const EdgeInsets.symmetric(horizontal: 13),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.brown, width: 3),
          borderRadius: BorderRadius.circular(50),
          color: Colors.grey[300]),
      child: Center(child: child),
    );
  }
}
