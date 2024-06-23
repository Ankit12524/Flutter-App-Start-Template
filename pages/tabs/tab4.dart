import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class tab4 extends StatefulWidget {
  const tab4({super.key});

  @override
  State<tab4> createState() => _DashboardState();
}

class _DashboardState extends State<tab4> {

  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings'),),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            ElevatedButton(onPressed: () {setState(() {
              _firebaseAuth.signOut();
            });}, child: Text('Logout'))
          ],
        ),
      ),
    );
  }
}
