import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souq/core/view_model/auth_view_model.dart';
import 'package:souq/core/view_model/navigation.dart';
import 'package:souq/view/Auth/SignUpPage/sign_up.dart';

import '../constants.dart';
import 'button.dart';
import 'customTextField.dart';

class SignCard extends GetWidget <AuthViewModel> {
  final String firstLeft;
  final String firstRight;
  final String secondColumnText;
  final String buttonText;
  final String labelText;
  final String labelText2;
  final VoidCallback buttonFunction;
  final VoidCallback firstRightPress;
  final Widget child;


 final FormFieldSetter<String> onSaved1;
  final FormFieldSetter<String> onSaved2;
  final FormFieldValidator<String> validator1;
      final FormFieldValidator<String> validator2;
  final TextEditingController controller1;
  final TextEditingController controller2;
  final GlobalKey<FormState> formKey;




  final String firstTextContainerheader;
  final String secondTextContainerheader;
  final String firstTextContainerHintText;
  final String secondTextContainerHintText;



  final String forgotPassword;
  final bool secondTextContainerObscure;

  const SignCard(
      {Key key,
        this.labelText,
        this.labelText2,
        this.formKey,
         this.onSaved1,
         this.onSaved2,
         this.validator1,
         this.validator2,
         this.controller1,
         this.controller2,

      this.firstLeft = "",
      this.firstRight = '',
      this.secondColumnText = '',
      this.forgotPassword = '',
       this.firstRightPress,

//TEXTfields text and hint and function
      this.firstTextContainerheader = "",
      this.secondTextContainerheader = "",
      this.firstTextContainerHintText = "",
      this.secondTextContainerHintText = "",
        this.secondTextContainerObscure = false,

//BUTTON TEXT AND FUNCTION
      this.buttonText = '',
       this.buttonFunction,
       this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    var height = size.height;
    var width = size.width;

    return Container(
      decoration: BoxDecoration(
        boxShadow: [

          BoxShadow(
            color: Colors.grey.withOpacity(0.1), //color of shadow
            spreadRadius: 1, //spread radius
            offset: Offset(0, 01), // changes position of shadow
            //first paramerter of offset is left-right
            //second parameter is top to down
          ),
          //you can set more BoxShadow() here
        ],
      ),
      child: Container(
        padding: EdgeInsets.only(top: 20, left: 15, right: 15),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  firstLeft,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 30),
                ),
                FlatButton(
                    onPressed: () {
                      print("go to sign up");
                      goToSignup(context);
                    },
                    child: Text(
                      firstRight,
                      style: TextStyle(color: kPrimaryColor, fontSize: 18),
                    ))
              ],
            ),
            SizedBox(
              height: height * 0.0001,
            ),
            Container(
                alignment: Alignment.topLeft,
                child: Text(
                  secondColumnText,
                  style: TextStyle(color: Colors.grey),
                )),
            SizedBox(
              height: height * 0.06,
            ),
            CustomTextField(
              labelText: labelText,
              formKey: formKey ,
                heading: firstTextContainerheader,
                hintText: firstTextContainerHintText,
                obscure: false,
            onSaved: onSaved1,
              validator: validator1,
              controller: controller1,
            ),
            SizedBox(
              height: height * 0.03,
            ),
            CustomTextField(
              labelText: labelText2,
                heading: secondTextContainerheader,
                hintText: secondTextContainerHintText,
                obscure: secondTextContainerObscure,
            onSaved: onSaved2,
              validator: validator2,
              controller: controller2,
            ),
            child,
            SizedBox(
              height: height * 0.025,
            ),
            GestureDetector(
              onTap: () {

controller.signOutGoogle();
                controller.signOutFacebook();


//                 try {
//                   if(controller.email != null)
//                     controller.signOutGoogle();
//                   print('sucess');
//                   print('forgot, signed out ');
//
//                 }catch(e){
// print(e);
//                 }


              },
              child: Container(
                  alignment: Alignment.centerRight,
                  child: Text(forgotPassword)),
            ),
            SizedBox(
              height: height * 0.025,
            ),
            button(
                text: buttonText,
                press: buttonFunction,
                color: kPrimaryColor,
                widthP: 0.8,
                radius: 7,
                textColor: Colors.white),
            SizedBox(
              height: height * 0.025,
            ),
          ],
        ),
      ),
    );
  }
}
