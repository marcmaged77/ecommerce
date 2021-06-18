import 'package:flutter/material.dart';
import 'package:souq/constants.dart';

class orDivider extends StatelessWidget {
  final double width;

  const orDivider({
     this.width,



});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(top: size.height * 0.015),
      width: size.width * 0.2,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Divider(
              thickness: 1.2,
              color: Colors.black,

            ),
          ),
          SizedBox(width: size.width * 0.01),
          Text(
            'OR',
            style: TextStyle(color: Colors.black),
          ),
          SizedBox(width: size.width * 0.01),
          Expanded(
            child: Divider(
              thickness: 1.2,
              color:                Colors.black,

            ),


          ),
        ],
      ),
    );
  }
}