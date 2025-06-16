import 'package:flutter/material.dart';
import 'package:work_order/providers/auth.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void handleLogin(BuildContext context) {
    final email = emailController.text;
    final password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      showMessage('Email dan Password tidak boleh kosong!');
      return;
    }

    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    authProvider.login(
      email,
      password,
      () {
        showMessage('Login berhasil!');
        Navigator.pushReplacementNamed(context, '/home');
      },
      () {
        showMessage('Email atau password salah');
      },
    );

    if (authProvider.isLoggedIn) {
      showMessage('Login berhasil!');
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      showMessage('Email atau password salah');
    }
  }

  void showMessage(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Email field
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),

            // Password field
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 24),

            // Login button
            ElevatedButton(
              onPressed: () => handleLogin(context),
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
