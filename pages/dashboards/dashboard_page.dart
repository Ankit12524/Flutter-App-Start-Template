import 'package:flutter/material.dart';

//TODO: Change the class name page title and body

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dashboard'),),
      body: Center(child: Text('Dashboard'),),
    );
  }
}
