import 'package:flutter/cupertino.dart';

class Utilities {
  static final Utilities _utilities = Utilities._internal();

  factory Utilities() {
    return _utilities;
  }

  Utilities._internal();

  static double screenHeight =
      MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.height;

  static double screenWidth =
      MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.width;

  navigatTo({required BuildContext context, required Widget screen}) {
    Future.delayed(
      Duration.zero,
      () {
        Navigator.pushReplacement(
          context,
          _MyRoute(
            builder: (context) => screen,
          ),
        );
      },
    );
  }

  pushTo({required BuildContext context, required Widget screen}) {
    Future.delayed(
      Duration.zero,
      () {
        Navigator.push(
          context,
          _MyRoute(
            builder: (context) => screen,
          ),
        );
      },
    );
  }
}

class _MyRoute extends CupertinoPageRoute {
  _MyRoute({required WidgetBuilder builder}) : super(builder: builder);

  @override
  Duration get transitionDuration => const Duration(milliseconds: 500);
}
