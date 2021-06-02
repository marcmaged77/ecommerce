import 'package:flutter/material.dart';
import 'package:souq/view/SignUpPage/sign_up.dart';

import '../constants.dart';
import 'button.dart';
import 'customTextField.dart';

class SignCard extends StatelessWidget {
  final String firstLeft;
  final String firstRight;
  final String secondColumnText;
  final String buttonText;
  final VoidCallback buttonFunction;
  final VoidCallback firstRightPress;
  final Widget child ;

  final String firstTextContainerheader;
  final String secondTextContainerheader;
  final String firstTextContainerHintText;
  final String secondTextContainerHintText;


  final String forgotPassword;

  const SignCard({
    Key? key,
    this.firstLeft = "",
    this.firstRight = '',
    this.secondColumnText = '',
    this.forgotPassword = '',

    required this.firstRightPress,


//TEXTfields text and hint and function
    this.firstTextContainerheader = "",
    this.secondTextContainerheader = "",
    this.firstTextContainerHintText= "",
    this.secondTextContainerHintText = "",

//BUTTON TEXT AND FUNCTION
    this.buttonText = '',
    required this.buttonFunction,

      required this.child
  }) : super(key: key);

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
            offset: Offset(0, 1), // changes position of shadow
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
print("hello");
Navigator.push(context, MaterialPageRoute(builder: (context) {
  return Signup();
}));



                    },
                    child: Text(
                      firstRight,
                      style: TextStyle(color: kPrimaryColor, fontSize: 18),
                    ))
              ],
            ),
            SizedBox(
              height: height * 0.001,
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
            CustomTextField(heading: firstTextContainerheader, hintText: firstTextContainerHintText, obscure: false),
            SizedBox(
              height: height * 0.03,
            ),
            CustomTextField(heading: secondTextContainerheader, hintText: secondTextContainerHintText, obscure: true),
            child,
            SizedBox(
              height: height * 0.025,
            ),



            GestureDetector(
              onTap: () {
                print('forgot');
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
                press:buttonFunction,
                color: kPrimaryColor,
                widthP: 0.8,
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


