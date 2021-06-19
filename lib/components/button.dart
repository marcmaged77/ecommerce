import 'package:flutter/material.dart';


class button extends StatelessWidget {
  final String text;
  final VoidCallback press;

  final Color color;
  final  Color textColor;
  final double widthP;
  final double radius;


  const button({
    this.radius,
     this.text,
     this.press,
     this.color,
     this.widthP,
     this.textColor
  }) ;



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;



   return Container(
     width: width * widthP,
     child: ClipRRect(
       borderRadius: BorderRadius.circular(radius != null ?  radius : 1,),
       child: FlatButton(
         padding: EdgeInsets.symmetric(horizontal: 45,vertical :15),
         color: color,
         onPressed: press,
         child: Text(text,style:TextStyle(color:textColor)),
       ),

       
     ),
   );
  }
}
