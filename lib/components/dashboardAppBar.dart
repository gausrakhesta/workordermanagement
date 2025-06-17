import 'package:flutter/material.dart';
import 'package:work_order/pages/profile.dart';

class DashboardAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String userName;
  final String userLevel;
  final int point;
  final int notificationCount;
  final String profileImageUrl; // Bisa pakai asset jika ingin offline

  const DashboardAppBar({
    super.key,
    required this.userName,
    required this.userLevel,
    required this.point,
    required this.notificationCount,
    required this.profileImageUrl,
  });

  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blueAccent[400],
      foregroundColor: Colors.black87,
      elevation: 0,
      automaticallyImplyLeading: false,
      flexibleSpace: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text(
                        userName,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 4),
                      const Icon(
                        Icons.brightness_1,
                        color: Colors.green,
                        size: 12,
                      ),
                    ],
                  ),
                  Text(
                    'Leader Marketing',
                    style: TextStyle(color: Colors.grey[100], fontSize: 13),
                  ),
                ],
              ),
              const Spacer(),

              // Tombol pencarian
              IconButton(
                icon: const Icon(Icons.search, color: Colors.white),
                onPressed: () {
                  // Aksi pencarian
                },
              ),

              // Notifikasi dengan badge
              Stack(
                alignment: Alignment.topRight,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.notifications_none,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      // Aksi buka notifikasi
                    },
                  ),
                  if (notificationCount > 0)
                    Positioned(
                      top: 6,
                      right: 6,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 20,
                          minHeight: 20,
                        ),
                        child: Text(
                          '$notificationCount',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 11,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                ],
              ),

              // Foto profil (jika dari URL)
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfilePage()),
                  );
                },
                child: CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(profileImageUrl),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
