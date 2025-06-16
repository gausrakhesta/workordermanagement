import 'package:flutter/material.dart';

class ResponsiveHelper {
  final BuildContext context;
  final Size size;
  final double width;
  final double height;

  ResponsiveHelper(this.context)
    : size = MediaQuery.of(context).size,
      width = MediaQuery.of(context).size.width,
      height = MediaQuery.of(context).size.height;

  bool get isMobile => width < 600;
  bool get isTablet => width >= 600 && width < 1024;
  bool get isDesktop => width >= 1024;

  double wp(double percent) => width * percent / 100; // Width in %
  double hp(double percent) => height * percent / 100; // Height in %

  double sp(double size) {
    // Scalable font size
    if (isMobile) return size;
    if (isTablet) return size * 1.2;
    return size * 1.4;
  }
}
