import 'package:flutter/material.dart';


class homeScreen extends StatelessWidget {



  late String email;

  homeScreen ({

   Key? key,
    required this.email,

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
            
            
            
          ],
        ),
      ),
    );
  }
}
