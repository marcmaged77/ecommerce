import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:souq/components/SignCard.dart';
import 'package:souq/components/customTextField.dart';
import 'package:souq/constants.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    var height = size.height;
    var width = size.width;

    final TextController1 = TextEditingController();
    final TextController2 = TextEditingController();
    final TextController3 = TextEditingController();

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPrimaryColor,
        title: Image.asset(
          "assets/icons/shopify.png",
          width: 120,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            top: height * 0.17,
            left: width * 0.060,
            right: width * 0.060,
          ),
          child: Column(
            children: <Widget>[
              SignCard(
                onSaved1: (value){} ,
                  onSaved2: (value){},
                  validator1: (value){},
                  validator2: (value){},
                  controller1: TextController1,
                  controller2: TextController2,



                  buttonFunction: () {
                    print('sign up');
                  },

                  firstRightPress: () {},

                  firstLeft: 'Sign Up',
                  buttonText: "SIGN UP",
                  firstTextContainerheader: 'Name',
                  secondTextContainerheader: 'Your Email',
                  firstTextContainerHintText: "Marc",
                  secondTextContainerHintText: "iamMarc@hotmailcom",

                  child: Column(children: <Widget>[
                    SizedBox(
                      height: height * 0.023,
                    ),
                    CustomTextField(
                      validator: (value){},
                      onSaved: (value){},
                        controller: TextController3,
                        heading: 'Password',
                        hintText: 'Your Password',
                        obscure: true)
                  ]))
            ],
          ),
        ),
      ),
    );
    ;
  }
}
