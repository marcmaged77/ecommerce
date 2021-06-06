import 'package:flutter/material.dart';


class homeScreen extends StatelessWidget {



  late String email;
  late String? name;

  homeScreen ({

   Key? key,
    required this.email,
     this.name,


  })
     : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(email),
            name != null ?  Text(name!) : Container()
            // Text(name)
            
            
            
          ],
        ),
      ),
    );
  }
}
