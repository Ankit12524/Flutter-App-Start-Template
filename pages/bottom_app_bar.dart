import 'package:flutter/material.dart';
import 'package:purchase_manager/pages/dashboards/home_page.dart';
import 'package:purchase_manager/pages/dashboards/purchases_page.dart';
import 'package:purchase_manager/pages/dashboards/items_page.dart';
import 'package:purchase_manager/pages/dashboards/dashboard_page.dart';

class AppBase extends StatefulWidget {
  const AppBase({super.key});

  @override
  State<AppBase> createState() => _AppBaseState();
}

class _AppBaseState extends State<AppBase> {


  int currentindex = 0;
  final screens = [
    HomePage(),
    PurchaseHistory(),
    Dashboard(),
    ItemsDashboard()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentindex,
        children: screens,),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: false,
        currentIndex: currentindex,
        backgroundColor: Colors.green,
        onTap: (index) => setState(() => currentindex = index),
        type : BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.trending_up),label: 'Data'),
          BottomNavigationBarItem(icon: Icon(Icons.list),label: 'List View'),
          BottomNavigationBarItem(icon: Icon(Icons.settings),label: 'Settings')

        ],),
    );
  }
}

