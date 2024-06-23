import 'package:flutter/material.dart';
import 'package:first_flutter_project/services/data_service.dart';
import 'package:fl_chart/fl_chart.dart';

class MonthlySalesGraphPage extends StatelessWidget {
  final data_service salesService = data_service();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Monthly Sales Graph')),
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

          monthlySalesSummary.sort((a, b) => b['month'].compareTo(a['month']));

          return SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Total Sales',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 300,
                    child: LineChart(LineChartData(
                      gridData: FlGridData(show: false),
                      titlesData: FlTitlesData(
                        leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: true)),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            getTitlesWidget: (value, meta) {
                              int index = value.toInt();
                              if (index < 0 || index >= monthlySalesSummary.length) {
                                return Container();
                              }
                              return Text(monthlySalesSummary[index]['month']);
                            },
                          ),
                        ),
                      ),
                      borderData: FlBorderData(
                        show: true,
                        border: Border.all(color: const Color(0xff37434d), width: 1),
                      ),
                      minX: 0,
                      maxX: (monthlySalesSummary.length - 1).toDouble(),
                      minY: 0,
                      maxY: monthlySalesSummary.map((e) => e['totalSales']).reduce((a, b) => a > b ? a : b).toDouble(),
                      lineBarsData: [
                        LineChartBarData(
                          spots: monthlySalesSummary
                              .asMap()
                              .entries
                              .map((entry) => FlSpot(entry.key.toDouble(), entry.value['totalSales'].toDouble()))
                              .toList(),
                          isCurved: true,
                          color: Colors.blue,
                          barWidth: 2,
                          belowBarData: BarAreaData(show: false),
                        ),
                      ],
                    )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Average Sales',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 300,
                    child: LineChart(LineChartData(
                      gridData: FlGridData(show: false),
                      titlesData: FlTitlesData(
                        leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: true)),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            getTitlesWidget: (value, meta) {
                              int index = value.toInt();
                              if (index < 0 || index >= monthlySalesSummary.length) {
                                return Container();
                              }
                              return Text(monthlySalesSummary[index]['month']);
                            },
                          ),
                        ),
                      ),
                      borderData: FlBorderData(
                        show: true,
                        border: Border.all(color: const Color(0xff37434d), width: 1),
                      ),
                      minX: 0,
                      maxX: (monthlySalesSummary.length - 1).toDouble(),
                      minY: 0,
                      maxY: monthlySalesSummary.map((e) => e['averageSales']).reduce((a, b) => a > b ? a : b).toDouble(),
                      lineBarsData: [
                        LineChartBarData(
                          spots: monthlySalesSummary
                              .asMap()
                              .entries
                              .map((entry) => FlSpot(entry.key.toDouble(), entry.value['averageSales'].toDouble()))
                              .toList(),
                          isCurved: true,
                          color: Colors.green,
                          barWidth: 2,
                          belowBarData: BarAreaData(show: false),
                        ),
                      ],
                    )),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
