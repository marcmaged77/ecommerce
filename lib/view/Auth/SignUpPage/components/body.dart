import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:souq/components/SignCard.dart';
import 'package:souq/components/customTextField.dart';
import 'package:souq/constants.dart';
import 'package:souq/core/view_model/auth_view_model.dart';

class Body extends GetWidget<AuthViewModel> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    var height = size.height;
    var width = size.width;

    final _formKey = GlobalKey<FormState>();

    final TextController1 = TextEditingController();
    final TextController2 = TextEditingController();
    final TextController3 = TextEditingController();

    return Scaffold(
      appBar: AppBar(

        elevation: 0,
        backgroundColor: Colors.transparent,
      leading: Padding(
        padding: EdgeInsets.only(top: 20),
        child: BackButton(
          color: Colors.black,
        ),
      ),
      ),

      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            top: height * 0.03,
            left: width * 0.060,
            right: width * 0.060,
          ),
          child: Column(
            children: <Widget>[
              SignCard(
                  onSaved1: (value) {
                    TextController1.text = value;
                  },
                  onSaved2: (value) {
                    TextController2.text = value;
                  },
                  labelText: "Enter Your Name",
                  validator1: (value) {},
                  validator2: (value) {},
                  controller1: TextController1,
                  controller2: TextController2,
                  buttonFunction: () async {
                    print('sign up');

                    controller.signUp(
                        name: TextController1.text,
                        email: TextController2.text,
                        password: TextController3.text);
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
                        validator: (value) {},
                        onSaved: (value) {
                          TextController3.text = value;
                        },
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
