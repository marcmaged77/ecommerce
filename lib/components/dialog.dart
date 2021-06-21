import 'package:flutter/material.dart';



class PopUp extends StatelessWidget {
  const PopUp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Column(children:[
        Image.asset('assets/icons/web_hi_res_512.png'),
        SizedBox(height: 10,),

        Center(child: Text('Message title'))]),
      content: Text('Are you tired of slow, inefficient charging with too many wires that get tangled with each other?',textAlign: TextAlign.center,),
      actions:
      [
        Row(

            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children:[ FlatButton(onPressed: (){}, child: Text('cancel', style: TextStyle(fontSize: 16),)),   FlatButton(onPressed: (){}, child: Text('Agree', style: TextStyle(fontSize: 16,color:Color(0xff00ADEF) ),)),]),


      ],
    );
  }
}
