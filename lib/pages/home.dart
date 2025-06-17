import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_order/providers/auth.dart';
import 'package:work_order/components/dashboardAppBar.dart';
import 'package:work_order/components/dashboardCard.dart';
import 'package:work_order/helpers/media_query.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: const DashboardAppBar(
        userName: "Gaus Rakhesta Anugerah",
        userLevel: "Gold",
        point: 9871,
        notificationCount: 22,
        profileImageUrl: "https://i.pravatar.cc/150?img=3",
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(MQ.hp(context, 2)),
          children: [
            const SizedBox(height: 16),
            // List DashboardCard
            ...List.generate(5, (index) {
              return DashboardCard(
                batchCode: '#BAT004273${index + 1}',
                client: 'IKEA${index + 1}',
                totalJobs: 5 + index,
                totalServices: 3 + index,
                date: '20 November 2024',
                status: 'Started',
              );
            }),
          ],
        ),
      ),
    );
  }
}
