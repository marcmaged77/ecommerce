import 'package:flutter/material.dart';
import 'package:souq/view/SignUpPage/sign_up.dart';



//navigate to signup screen
void goToSignup(BuildContext context){
  Navigator.push(context, MaterialPageRoute(builder: (context) {
    return Signup();
  }));


}


