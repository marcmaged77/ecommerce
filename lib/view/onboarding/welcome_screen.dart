import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    var height = size.height;
    var width = size.width;

    return Scaffold(

      body:Container(
        height: height ,
        width: width,
        child: Stack(
        children: [
          Image.asset('assets/background/BG.png',width: width,height: height,fit: BoxFit.fitWidth,),
          Image.asset('assets/background/Overlay.png',width: width,height: height,fit: BoxFit.cover,),


          Container(
            padding: EdgeInsets.only(left: width* 0.06,right: width* 0.06),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    alignment: Alignment.topLeft,

                    padding: EdgeInsets.all(10),
                    child: Text('Welcome To Shopify,\nan e-commerce app !',style:TextStyle(fontSize: 24, color: Colors.white, fontFamily: "second") ,)),

         Container(
           alignment: Alignment.topLeft,
             padding: EdgeInsets.all(10),

             child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore'
                 ' et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex'
                 ' ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.'
                 ' Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', style: TextStyle(fontSize: 16,color: Colors.white, fontFamily: 'second') ,)) ,

                SizedBox(height: 30,),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      boxShadow:  [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          //color of shadow
                          spreadRadius: 0.5,
                          //spread radius
                          offset:
                          Offset(0, 0), // changes position of shadow
                          //first paramerter of offset is left-right
                          //second parameter is top to down
                        ),
                        //you can set more BoxShadow() here
                      ],
                      color: Colors.white

                  ),

                  child: ListTile(
                    onTap: (){
                      


                      print('home');},


                    leading:Image.asset('assets/listile/Home-color.png') ,
                    title: Text('Go To The Home page', style: TextStyle(fontFamily: "second", fontSize: 20),),
                    subtitle:Text('Start to explore your shopping paradise', style: TextStyle(fontFamily: "second", fontSize: 15, color: Color(0xff7E8287)),),
                    trailing: Icon(Icons.arrow_forward_ios),

                  ),
                ),

                SizedBox(height: 10,),


                Container(

                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      boxShadow:  [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          //color of shadow
                          spreadRadius: 0.5,
                          //spread radius
                          offset:
                          Offset(0, 0), // changes position of shadow
                          //first paramerter of offset is left-right
                          //second parameter is top to down
                        ),
                        //you can set more BoxShadow() here
                      ],
                      color: Colors.white

                  ),

                  child: ListTile(
                    onTap: (){},

                    leading:Image.asset('assets/listile/Search-color.png') ,
                    title: Text('Search your products', style: TextStyle(fontFamily: "second", fontSize: 20),),
                    subtitle:Text('You can search what you need so quick', style: TextStyle(fontFamily: "second", fontSize: 15, color: Color(0xff7E8287)),),
                    trailing: Icon(Icons.search),

                  ),
                ),

                SizedBox(height: 10,),
                Container(

                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      boxShadow:  [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          //color of shadow
                          spreadRadius: 0.5,
                          //spread radius
                          offset:
                          Offset(0, 0), // changes position of shadow
                          //first paramerter of offset is left-right
                          //second parameter is top to down
                        ),
                        //you can set more BoxShadow() here
                      ],
                      color: Colors.white

                  ),

                  child: ListTile(
                    onTap: (){},

                    leading:Image.asset('assets/listile/FAQ-color.png') ,
                    title: Text('You need the help ?', style: TextStyle(fontFamily: "second", fontSize: 20),),
                    subtitle:Text('Support team can help you 24/7', style: TextStyle(fontFamily: "second", fontSize: 15, color: Color(0xff7E8287)),),
                    trailing: Icon(Icons.quiz),

                  ),
                ),



              ],
            ),
          )




        ],

          ),
      ) ,


    );
  }
}
