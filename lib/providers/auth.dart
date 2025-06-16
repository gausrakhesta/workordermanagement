import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class AuthProvider with ChangeNotifier {
  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;

  AuthProvider() {
    final box = Hive.box('authBox');
    _isLoggedIn = box.get('isLoggedIn', defaultValue: false);
  }

  void login(
    String email,
    String password,
    VoidCallback onSuccess,
    VoidCallback onFail,
  ) {
    if (email == 'admin@example.com' && password == '123456') {
      _isLoggedIn = true;
      Hive.box('authBox').put('isLoggedIn', true);
      notifyListeners();
      onSuccess(); // ✅ pindah page dari sini
    } else {
      onFail();
    }
  }

  void logout() {
    _isLoggedIn = false;
    Hive.box('authBox').put('isLoggedIn', false);
    notifyListeners();
  }
}
