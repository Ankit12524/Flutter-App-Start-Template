import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';




class Loading_Screen extends StatefulWidget {
  const Loading_Screen({super.key});

  @override
  State<Loading_Screen> createState() => _Loading_ScreenState();
}

class _Loading_ScreenState extends State<Loading_Screen> {






  @override
  void initState() {
    // TODO: implement initState
    super.initState();


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(child:SpinKitChasingDots(
          color: Theme.of(context).primaryColor,
          size: 50
      )),
    );
  }
}
