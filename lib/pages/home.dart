import 'package:flutter/material.dart';
import 'package:work_order/components/dashboardAppBar.dart';
import 'package:work_order/components/dashboardCard.dart';
import 'package:work_order/helpers/media_query.dart';
// ganti sesuai lokasi

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
      body: ListView.builder(
        padding: EdgeInsets.only(top: MQ.hp(context, 2)),
        itemCount: 5,
        itemBuilder: (context, index) {
          return DashboardCard(
            batchCode: '#BAT004273${index + 1}',
            client: 'IKEA${index + 1}',
            totalJobs: 5 + index,
            totalServices: 3 + index,
            date: '20 November 2024',
            status: 'Started',
          );
        },
      ),
    );
  }
}
