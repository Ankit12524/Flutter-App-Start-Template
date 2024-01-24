import 'package:flutter/material.dart';




//TODO: Change the class name page title and body

class PurchaseHistory extends StatefulWidget {
  const PurchaseHistory({super.key});

  @override
  State<PurchaseHistory> createState() => _PurchaseHistoryState();
}

class _PurchaseHistoryState extends State<PurchaseHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Purchases'),),
      body: Center(child: Text('Purchases'),),
    );
  }
}
