class SalesData {
  final String date;
  final int sales;

  SalesData({required this.date, required this.sales});

  factory SalesData.fromMap(Map<String, dynamic> data) {
    return SalesData(
      date: data['date'] ?? '',
      sales: data['sales'] ?? 0,
    );
  }
}
