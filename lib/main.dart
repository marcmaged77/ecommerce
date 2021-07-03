// @dart=2.9

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:souq/core/helper/binding.dart';
import 'package:souq/view/Auth/LoginPage/components/textfieldTest.dart';
import 'package:souq/view/HomeScreen/home_screen.dart';
import 'package:souq/view/Auth/LoginPage/loginScreen.dart';
import 'package:flutter/services.dart';
import 'package:souq/view/Splash/splash_screen.dart';
import 'package:souq/view/control_view.dart';
import 'package:souq/view/onboarding/welcome_screen.dart';
import 'package:souq/view/widgets/alertLocation/alert_location.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setEnabledSystemUIOverlays([
  //   SystemUiOverlay.bottom, //This line is used for showing the bottom bar
  // ]);

  // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  //   statusBarColor: Colors.black,
  //     systemNavigationBarColor: Colors.black
  // ));


  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}




class MyApp extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {


    return GetMaterialApp(
      initialBinding: Binding(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'first',
        backgroundColor: Colors.white,

        primarySwatch: Colors.blue,
      ),
      home: LoginScreen()



      // AnimatedSplashScreen(
      //   splash: Splash(),
      //   nextScreen: WelcomeScreen(),
      //   splashTransition: SplashTransition.fadeTransition,
      //
      //
      // )


      // SplashScreen( seconds: 2,
      //   imageBackground:       AssetImage('assets/background/BG.png',),
      //   image: Image.asset('assets/logo/Logo-img.png', ),
      //   photoSize: 70,
      //   useLoader: false,
      //   title:           Text('WELCOME TO', style: TextStyle(letterSpacing: 5, fontSize: 14, color: Colors.white, fontFamily: 'thirdLight',fontWeight: FontWeight.bold ),),
      //
      //   // subtitle:             Text('SHOPIFY', style: TextStyle(fontSize: 24, color: Colors.white, fontFamily: 'third'),),
      // navigateAfterSeconds: ControlView(),
      //
      //   // subtitle: Text('SHOPIFY', style: TextStyle(fontSize: 24, color: Colors.white, fontFamily: 'third'),),
      // navigateAfterSeconds: LoginScreen(),
      //
      // ),


    );
  }
}


// SplashScreen( seconds: 2, imageBackground:       AssetImage('assets/background/BG.png',), image: Image.asset('assets/logo/Logo-img.png', ), photoSize: 70, useLoader: false, title:           Text('WELCOME TO', style: TextStyle(letterSpacing: 5, fontSize: 14, color: Colors.white, fontFamily: 'thirdLight',fontWeight: FontWeight.bold ),), subtitle:             Text('SHOPIFY', style: TextStyle(fontSize: 24, color: Colors.white, fontFamily: 'third'),), )