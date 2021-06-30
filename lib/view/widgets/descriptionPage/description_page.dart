import 'package:flutter/material.dart';
import 'package:souq/model/productModel.dart';
import 'package:souq/model/products_mode.dart';




class Description extends StatelessWidget {
  Product model;

   Description({Key key,
   this.model
   }) : super(key: key);

  @override
  Widget build(BuildContext context) {


    Size size = MediaQuery.of(context).size;

    var height = size.height;
    var width = size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: BackButton(color: Colors.black,),


      ),
      extendBodyBehindAppBar: true,
      body: Container(
        padding: EdgeInsets.only(
          left: width * 0.060,
          right: width * 0.060,
          top: width * 0.060,
        ),
        child: Column(
          children: [
            SizedBox(height: 20,),

            Text('Description',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 26,
                  fontFamily: "second"),
            ) ,
            Text(model.price,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 26,
                  fontFamily: "second"),
            ) ,
SizedBox(height: 20,),
          Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.') ,
          ],
        ),

      ),

    );
  }
}
