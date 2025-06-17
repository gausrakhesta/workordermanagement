import 'package:flutter/material.dart';
import 'package:work_order/components/appHeader.dart';

class DetailPage extends StatelessWidget {
  final String batchCode;
  final String client;
  final String status;

  const DetailPage({
    super.key,
    required this.batchCode,
    required this.client,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeader(title: 'Detail $client'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text('Client: $client'), Text('Status: $status')],
        ),
      ),
    );
  }
}
