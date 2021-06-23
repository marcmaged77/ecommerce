import 'package:flutter/material.dart';




class Splash extends StatelessWidget {
  const Splash({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    var height = size.height;
    var width = size.width;

    return Scaffold(
      body:Stack(
    children: [
      Image.asset('assets/background/BG.png',width: width,height: height,fit: BoxFit.cover,),



      Positioned(
        top: height * 0.4,
        left: width * 0.3,
        child: Center(

          child: Column(

              children:[

            Image.asset('assets/logo/Logo-img.png'),
            SizedBox(height: 20,),
            Text('WELCOME TO', style: TextStyle(letterSpacing: 5, fontSize: 14, color: Colors.white, fontFamily: 'third'),),
            SizedBox(height: 5,),

            Text('SHOPIFY', style: TextStyle(fontSize: 24, color: Colors.white, fontFamily: 'third'),),

          ]),
        ),
      )



    ],
    ));
  }
}
