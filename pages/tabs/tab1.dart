import 'package:flutter/material.dart';
import 'package:first_flutter_project/services/data_service.dart';


import 'package:first_flutter_project/pages/tabs/tab2.dart';
import 'package:first_flutter_project/pages/other/diaglog.dart';
import 'package:fluttertoast/fluttertoast.dart';




class DashboardPage extends StatelessWidget {
  final data_service salesService = data_service();




  void _showAddSalesDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AddSalesDialog(
          onAdd: (date, sales) async {
            try {
              await salesService.addSales(date, sales);
              Navigator.of(context).pop();
              Fluttertoast.showToast(msg: 'Sales added successfully', toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM);
            } catch (e) {
              Fluttertoast.showToast(msg: 'Error adding sales: $e', toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM);
            }
          },
        );
      },
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
            onPressed: () => _showAddSalesDialog(context),
            child: Icon(Icons.add)),
      appBar: AppBar(title: Text('Dashboard')),
      body: StreamBuilder<Map<String, dynamic>>(
        stream: salesService.getMonthlySalesStream(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          final salesData = snapshot.data ?? {};
          final Map<String, List<int>> monthlySales = {};


          salesData.forEach((date, sales) {
            final month = date.substring(0, 7); // Assuming date format is YYYY-MM-DD
            if (!monthlySales.containsKey(month)) {
              monthlySales[month] = [];
            }
            monthlySales[month]!.add(sales as int);

          });

          // Compute total and average sales for each month
          final List<Map<String, dynamic>> monthlySalesSummary = monthlySales.entries.map((entry) {

            final month = entry.key;
            final totalSales = entry.value.reduce((a, b) => a + b);
            final averageSales = totalSales / entry.value.length;
            return {
              'month': month,
              'totalSales': totalSales,
              'averageSales': averageSales
            };
          }).toList();

          // Sort the monthly data in descending order
          monthlySalesSummary.sort((a, b) => b['month']?.compareTo(a['month']));

          return ListView(
            children: monthlySalesSummary.map((entry) {
              return ListTile(
                title: Text(entry['month'].toString()),
                subtitle: Text('Total Sales: ${entry['totalSales']} | Avg Sales: ${entry['averageSales']!.toStringAsFixed(2)}'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DailySalesPage(month: entry['month'].toString())),
                  );
                },
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
