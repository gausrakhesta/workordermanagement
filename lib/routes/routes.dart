import 'package:flutter/material.dart';
import '../pages/login.dart';
import '../pages/home.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/': (context) => const LoginPage(),
  '/home': (context) => const HomePage(),
};
