import 'package:flutter/material.dart';
import 'package:souq/components/button.dart';
import 'package:souq/constants.dart';
import 'package:souq/model/products_mode.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';

class DetailScreen extends StatelessWidget {
  ProductModel model;

  DetailScreen({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    var height = size.height;
    var width = size.width;
    return Scaffold(


      bottomNavigationBar:

          Container(
            padding: EdgeInsets.only(left: 15,right: 15,bottom: 10),
            child: Container(
              padding: EdgeInsets.only(
                left: width * 0.060,
                right: width * 0.060,
                bottom: height * 0.009,

              ),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.9),
                      //color of shadow
                      spreadRadius: 0.1,
                      //spread radius
                      offset:
                      Offset(0.2, 0.2), // changes position of shadow
                      //first paramerter of offset is left-right
                      //second parameter is top to down
                    ),
                    //you can set more BoxShadow() here
                  ],
                  borderRadius: BorderRadius.circular(7),
                  color: Colors.white),
              height: 60,
              child:


              Container(

                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7)
                ),
                child:


                //price and add
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    //price
                    Container(
                      padding: EdgeInsets.only(top: 10,left: 10),
                      child: Column(
                        children: [
                          Text('Price',style: TextStyle(fontSize: 15),),
                          Text(model.price, style: TextStyle(color: Color(0xff0a81ab), fontSize: 20),),
                        ],
                      ),
                    ),
                    //add
                    Container(
                        padding: EdgeInsets.only(right:10,top: 7),
                        child: button(radius: 6, text: 'ADD',color: Color(0xff0a81ab), widthP: 0.3,press: (){},textColor: Colors.black,))


                  ],


                ),
              ),
            ),
          ),
extendBody: true,



      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
          child: Container(
        child: Column(
          children: [
            Container(
                width: MediaQuery.of(context).size.width,
                child: Image.network(
                  model.pic,
                  fit: BoxFit.fill,
                )),


            ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////after image//////////////////////////////////////////////////////////////////////////
            Container(
              padding: EdgeInsets.only(
                left: width * 0.060,
                right: width * 0.060,
              ),
              child: Column(
                children: [
                  Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        model.name,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 26,
                            fontFamily: "second"),
                      )),

                  Container(
                    padding: EdgeInsets.only(bottom: 15),
                      child: Column(
                        children:[

                          Text(
                          "${model.price} EGP",
                          style: TextStyle(
                            color: kPrimaryColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 26,
                              fontFamily: "second"),
                        ),

                          Text(
                            "All Price include Vat",
                            style: TextStyle(
                              color: Colors.grey,
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                fontFamily: "second"),
                          ),

                          Text(
                            "FREE Shipping",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                fontFamily: "second"),
                          ),

                        ])),

                  Divider(
                    color: Colors.grey.shade700,
                  ),


SizedBox(height: 5,),

                  //Size And Colour
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: (){},
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            padding: EdgeInsets.all(7),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.grey)
                            ),

                            child: Container(

                              padding: EdgeInsets.only(right: 9, left: 9),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Size", style: TextStyle(fontSize: 17),),
                                  Text(
                                    "M",
                                    style: TextStyle(fontWeight: FontWeight.w600,fontSize: 17),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          padding: EdgeInsets.all(7),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.grey)
                          ),

                          child: Container(

                            padding: EdgeInsets.only(right: 9, left: 9),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Color", style: TextStyle(fontSize: 17),),
                                Container(
                                  width: 20,
                                  height: 18,

                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                      color: Color(0xff1E6F5C)
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                  SizedBox(height: 5,),
                  Divider(
                    color: Colors.grey.shade700,
                  ),
                  SizedBox(height: 5,),


                ListTile(
                  onTap: (){},
                  title:Text('Description',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 26,
                        fontFamily: "second"),
                  ) ,
                  subtitle:Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.')) ,
                trailing: Padding(
                    padding: EdgeInsets.only(top:70),
                    child: Icon(Icons.arrow_forward_ios)),


                ),

                  SizedBox(height: 100,),

                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
