import 'package:flutter/material.dart';
import 'package:purchase_manager/pages/loading.dart';
import 'package:purchase_manager/pages/bottom_app_bar.dart';
import 'package:purchase_manager/pages/login/login.dart';
import 'package:purchase_manager/pages/login/signup.dart';
import 'package:purchase_manager/pages/settings_page.dart';



void main() async {


  //Uncomment below code after registering app with firebase Firebase option file need to exist
  /*
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  */

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Purchase Manager',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        //colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      //home: //home is not need when routes is defined '/' is home directory,


    routes: {
    '/' : (context) => Loading_Screen(),
    '/app_base': (context) => AppBase(),
    '/login': (context) => LogIn(),
    '/signup': (context) => SignUp(),
    '/settings' : (context) => SettingsPage()
      }
    );
  }
}
