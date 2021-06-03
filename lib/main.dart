import 'package:flutter/material.dart';
import 'package:souq/view/LoginPage/loginScreen.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([
    SystemUiOverlay.bottom, //This line is used for showing the bottom bar
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'first',
        backgroundColor: Colors.white,

        primarySwatch: Colors.blue,
      ),
      home:Scaffold(

        body: LoginScreen(),
      ),
    );
  }
}


