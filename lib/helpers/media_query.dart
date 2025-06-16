import 'package:flutter/material.dart';

class MQ {
  static double height(BuildContext context) =>
      MediaQuery.of(context).size.height;
  static double width(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static double hp(BuildContext context, double percent) =>
      MediaQuery.of(context).size.height * percent / 100;

  static double wp(BuildContext context, double percent) =>
      MediaQuery.of(context).size.width * percent / 100;
}
