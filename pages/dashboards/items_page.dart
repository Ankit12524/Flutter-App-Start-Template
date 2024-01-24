import 'package:flutter/material.dart';


//TODO: Change the class name page title and body



class ItemsDashboard extends StatefulWidget {
  const ItemsDashboard({super.key});

  @override
  State<ItemsDashboard> createState() => _ItemsDashboardState();
}

class _ItemsDashboardState extends State<ItemsDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Items'),),
      body: Center(child: Text('Items'),),
    );
  }
}
