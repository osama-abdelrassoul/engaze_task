import 'package:flutter/material.dart';

class TopBarLogin extends StatelessWidget {
  const TopBarLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Column(
          children: [
            SizedBox(
              height: screenHeight * 0.16,
            ),
            Container(
              height: screenHeight * 0.14,
              width: screenWidth * 0.30,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(300),
                  image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/profile.png'))),
            )
          ],
        )
      ],
    );
  }
}
