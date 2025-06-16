import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_order/helpers/responsive.dart';
import 'package:work_order/providers/auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool _isLoading = false;

  void handleLogin() {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    final email = emailController.text.trim();
    final password = passwordController.text.trim();
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

    setState(() => _isLoading = false);
  }

  void showMessage(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveHelper(context);

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: responsive.isDesktop
                ? responsive.wp(30)
                : responsive.isTablet
                ? responsive.wp(20)
                : 24,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Icon(
                  Icons.lock_outline,
                  size: responsive.isTablet ? 72 : 48,
                  color: Colors.blue,
                ),
                SizedBox(height: 24),
                Text(
                  'Welcome Back!',
                  style: TextStyle(
                    fontSize: responsive.isTablet ? 28 : 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 32),

                // Email Field
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty)
                      return 'Email tidak boleh kosong';
                    if (!RegExp(
                      r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$',
                    ).hasMatch(value)) {
                      return 'Format email tidak valid';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.email_outlined),
                    labelText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Password Field
                TextFormField(
                  controller: passwordController,
                  obscureText: _obscurePassword,
                  validator: (value) {
                    if (value == null || value.isEmpty)
                      return 'Password tidak boleh kosong';
                    if (value.length < 6) return 'Minimal 6 karakter';
                    return null;
                  },
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () =>
                          setState(() => _obscurePassword = !_obscurePassword),
                    ),
                    labelText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // Login Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : handleLogin,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      backgroundColor: Colors.blue,
                    ),
                    child: _isLoading
                        ? const SizedBox(
                            width: 24,
                            height: 24,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2,
                            ),
                          )
                        : const Text(
                            'Login',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                  ),
                ),
                const SizedBox(height: 16),

                TextButton(
                  onPressed: () {
                    // TODO
                  },
                  child: const Text('Lupa password?'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
