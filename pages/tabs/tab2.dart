import 'package:flutter/material.dart';
import 'package:first_flutter_project/services/data_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_flutter_project/services/data_model.dart';

class DailySalesPage extends StatelessWidget {
  final String month;
  final data_service salesService = data_service();

  DailySalesPage({required this.month});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sales for $month')),
      body: StreamBuilder<List<SalesData>>(
        stream: salesService.getDailySalesStream(month),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          final dailySales = snapshot.data ?? [];

          return ListView(
            children: dailySales.map((salesData) {
              return ListTile(
                title: Text(salesData.date),
                subtitle: Text('Sales: ${salesData.sales}'),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}

class tab2 extends StatefulWidget {
  const tab2({super.key});

  @override
  State<tab2> createState() => _tab2State();
}

class _tab2State extends State<tab2> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder(child: Text('tab2'),);
  }
}

