import 'package:flutter/material.dart';
import 'package:first_flutter_project/pages/tabs/tab2.dart';
import 'package:first_flutter_project/pages/tabs/tab3.dart';
import 'package:first_flutter_project/pages/tabs/tab4.dart';
import 'package:first_flutter_project/pages/tabs/tab1.dart';





class app_base extends StatefulWidget {
  const app_base({super.key});

  @override
  State<app_base> createState() => _app_baseState();
}

class _app_baseState extends State<app_base> {

  int current_index = 0;
  final screens = [
    DashboardPage(),
    tab2(),
    MonthlySalesGraphPage(),
    tab4()
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IndexedStack(
            index: current_index,
            children: screens),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: current_index,
          onTap: (index) => setState(() => current_index = index),
          //unselectedItemColor: ,
          //selectedItemColor: ,
          //backgroundColor: ,                     //when animation is removed fixed color to whole bottom navigation bar is given
          //type: BottomNavigationBarType.fixed,  //to remove animation
          //iconSize: ,
          //selectedFontSize: ,
          //unselectedFontSize: ,
          showUnselectedLabels: false,
          showSelectedLabels: true, //default is true

          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home',backgroundColor: Theme.of(context).colorScheme.primary),
            BottomNavigationBarItem(icon: Icon(Icons.list),label: 'List',backgroundColor: Colors.teal),
            BottomNavigationBarItem(icon: Icon(Icons.trending_up),label: 'Trends',backgroundColor: Theme.of(context).colorScheme.primary),
            BottomNavigationBarItem(icon: Icon(Icons.settings),label: 'Settings',backgroundColor: Colors.red[300]),
          ],)


    );
  }
}

