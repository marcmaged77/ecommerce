import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:souq/components/button.dart';



class LocationAlert extends StatelessWidget {
  const LocationAlert({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    var height = size.height;
    var width = size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: height * 0.2, left: width * 0.09, right:  width * 0.09),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
Container(

    child: Image.asset('assets/icons/icon-locations.png')),
              Container(
                child: Text('TURN ON YOUR LOCATION', style: TextStyle( fontSize: 20, color: Colors.black, fontFamily: 'second'),),
              ),

              SizedBox(height: 10,),
              Container(child: Text('To continues, let your device turn on location, which uses Google’s location service',textAlign: TextAlign.center, style: TextStyle(  fontSize: 15, color: Colors.black, fontFamily: 'second'),)),
              SizedBox(height:170,),


              button( radius: 10, text: 'YES, TURN IT ON',press: (){}, color: Color(0xff00ADEF),widthP: width * 0.3, textColor: Colors.white,),
              button( radius: 10, text: 'Cancel',press: (){}, color: Colors.transparent,widthP: width * 0.3, textColor: Colors.black,)
            ],
          ),


        ),
      ),
    );
  }
}
