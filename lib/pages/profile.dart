import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_order/components/appHeader.dart';
import 'package:work_order/components/dashboardAppBar.dart';
import 'package:work_order/providers/auth.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _isLoading = false;

  void handleLogout() {
    setState(() => _isLoading = true);

    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    authProvider.logout();

    setState(() => _isLoading = false);

    Navigator.pushReplacementNamed(context, '/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeader(title: 'Profile'),
      body: Center(
        child: ListView(
          children: [
            const SizedBox(height: 16),
            const Center(
              child: CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(
                  'https://via.placeholder.com/150',
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Center(
              child: Text(
                'John Doe',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const Center(child: Text('johndoe@email.com')),
            const Divider(height: 32),

            // List menu
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Edit Profile'),
              onTap: () {
                // buka halaman edit profil
              },
            ),
            ListTile(
              leading: const Icon(Icons.lock),
              title: const Text('Ubah Password'),
              onTap: () {
                // aksi ubah password
              },
            ),
            ListTile(
              leading: const Icon(Icons.phone),
              title: const Text('Nomor Telepon'),
              subtitle: const Text('+62 812-3456-7890'),
              onTap: () {
                // mungkin nonaktif atau hanya tampil
              },
            ),
            const Divider(),

            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text('Logout', style: TextStyle(color: Colors.red)),
              onTap: _isLoading ? null : handleLogout,
              trailing: _isLoading
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
