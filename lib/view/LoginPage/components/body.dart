import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:souq/components/SignCard.dart';
import 'package:souq/components/orDivider.dart';
import 'package:souq/core/view_model/auth_view_model.dart';

import '../../../constants.dart';









class Body extends GetWidget<AuthViewModel>  {



  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    final TextController1 = TextEditingController();
    final TextController2 = TextEditingController();
    final TextController3 = TextEditingController();


    bool showSpinner = false;






    var height = size.height;
    var width = size.width;
    return Scaffold(
      appBar: AppBar(
          title: Image.asset(
            "assets/icons/shopify.png",
            width: 120,
          ),
          centerTitle: true,
          backgroundColor: kPrimaryColor,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black)),


      extendBodyBehindAppBar: true,


      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            top: height * 0.17,
            left: width * 0.060,
            right: width * 0.060,
          ),
          child: Column(children: <Widget>[
            SignCard(

              //fUNCTIONS,
              onSaved1: (value){TextController1.text= value;},
                onSaved2: (value){TextController2.text = value;},
                validator1: (val) => val.isNotEmpty ? null : " please enter a email address",
                validator2: (val)=> val.length < 6 ? " please 6 or more character" : null,
                controller1:TextController1 ,
                controller2: TextController2,


                firstRightPress: () {
                  print('helloooo');
                },

                buttonFunction: ()  {
                  showSpinner = true;

                  print('signin');

                    controller.signIn(email: TextController1.text , password: TextController2.text );



                },


                ///////////////////////////////////////////////////UI///////////////////////////////////////////////////////////
                firstLeft: 'Welcome,',
                firstRight: 'Sign Up',
                secondColumnText: 'Sign In To Continue',

                firstTextContainerheader: "Your Email",
                secondTextContainerheader: "Password",
                firstTextContainerHintText: "iamMarc@hotmail.com",
                secondTextContainerHintText: "Password",
                secondTextContainerObscure: true,

                forgotPassword: 'Forgot Password?',
                buttonText: 'SIGN IN',

                child: SizedBox(
                  height: 0,
                )),

            ////////////////////////////////////////////////////////////////////////////////////////////////////////////
            orDivider(width: 0.06),
            SizedBox(
              height: height * 0.01,
            ),



            ////////////////////////////////////////SOCIAL SIGNING////////////////////////////////////////////////////

            /////////////////////////////////////////////fACEBOOK//////////////////////////////////////////////
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: Colors.grey),
                shape: BoxShape.rectangle,
              ),
              child: ListTile(
                onTap: ()  {
                  print('sign in facebook');
                  showSpinner = true;

                  controller.facebookSignInMethod();
                },
                title: Text('Sign In With Facebook'),
                leading: SvgPicture.asset(
                  "assets/icons/facebook.svg",
                  color: kPrimaryColor,
                ),
              ),
            ),


            SizedBox(
              height: height * 0.025,
            ),


            /////////////////////////////////////////////GOOGLE//////////////////////////////////////////////
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: Colors.grey),
                shape: BoxShape.rectangle,
              ),
              child: ListTile(
                onTap: () {
                  print('sign in google');
                  showSpinner = true;


                  controller.googleSignInMethod();
                },
                title: Text('Sign In With Google'),
                leading: SvgPicture.asset(
                  "assets/icons/google-plus.svg",
                  width: 33,
                  color: kPrimaryColor,
                ),
              ),
            ),
            SizedBox(height: 30,)
          ]),
        ),
      ),
    );

  }


}
