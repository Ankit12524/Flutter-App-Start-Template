import 'package:flutter/material.dart';

class Loading_Screen extends StatefulWidget {
  const Loading_Screen({super.key});

  @override
  State<Loading_Screen> createState() => _Loading_ScreenState();
}

class _Loading_ScreenState extends State<Loading_Screen> {

  switch_screen () async {

    //TODO: replace future delay with any funtion you wish to perform before loading the app
    await Future.delayed(Duration(seconds: 2),() {
      setState(() {
        Navigator.pushReplacementNamed(context, '/app_base');
      });;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    switch_screen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(
      //title: Text('Loading Screen'),

      body: Center(
        //TODO: import Spinkitwave spinner lib
        child: SpinKitWaveSpinner(  //package name : Spinkit
            color: Theme.of(context).colorScheme.primary
        ),
      ),
    );
  }
}
