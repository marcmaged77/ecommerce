import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:souq/components/SignCard.dart';
import 'package:souq/components/orDivider.dart';
import 'package:souq/core/view_model/auth_view_model.dart';
import 'package:email_validator/email_validator.dart';
import 'package:validators/validators.dart';

import '../../../../constants.dart';









class Body extends GetWidget<AuthViewModel>  {



  @override
  Widget build(BuildContext context) {


    final GlobalKey<FormState> _formKey = GlobalKey();

    // This function is triggered when the "Save" button is pressed
    void _saveForm() {
      final bool isValid = _formKey.currentState.validate();
      if(isValid){
        print('Got a valid input');
        // And do something here
      }
    }



    Size size = MediaQuery.of(context).size;
    final TextController1 = TextEditingController();
    final TextController2 = TextEditingController();
    final TextController3 = TextEditingController();








    var height = size.height;
    var width = size.width;
    return GetBuilder<AuthViewModel>(

      init: Get.find(),
      builder: (controller)=>

          ModalProgressHUD(
            inAsyncCall: controller.loading.value,
            child: Scaffold(
        // appBar: AppBar(
        //     title: Image.asset(
        //       "assets/icons/shopify.png",
        //       width: 120,
        //     ),
        //     centerTitle: true,
        //     backgroundColor: kPrimaryColor,
        //     elevation: 0,
        //     iconTheme: IconThemeData(color: Colors.black)),
        //
        //
        // extendBodyBehindAppBar: true,


        body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                top: height * 0.10,
                left: width * 0.060,
                right: width * 0.060,
              ),
              child: Column(children: <Widget>[
                SignCard(

                  //fUNCTIONS,
                    formKey: controller.formKey,
                    onSaved1: (value){TextController1.text= value;},
                    onSaved2: (value){TextController2.text = value;},
                    validator1:(value) {
                      if (!isEmail(value)) {
                        return "Please enter a valid email";
                      }

                      return null;
                    },
                    validator2:(value) {
                      if (value.trim().length < 8) {
                        return 'This field requires a minimum of 8 characters';
                      }

                      return null;
                    },
                    controller1:TextController1 ,
                    controller2: TextController2,
                    labelText: "Email",
                    labelText2: "Password",

                    firstRightPress: () {
                      print('helloooo');
                    },

                    buttonFunction: ()  {

                      print('signin');
                      controller.saveForm();
                      controller.signIn(email: TextController1.text , password: TextController2.text );



                    },


                    ///////////////////////////////////////////////////UI///////////////////////////////////////////////////////////
                    firstLeft: 'Welcome,',
                    firstRight: 'Sign Up',
                    secondColumnText: 'Sign In To Continue',

                    firstTextContainerheader: "Your Email",
                    secondTextContainerheader: "Password",
                    firstTextContainerHintText: "iamMarc@hotmail.com",
                    secondTextContainerHintText: "Not less than 8 characters",
                    secondTextContainerObscure: true,

                    forgotPassword: 'Forgot Password?',
                    buttonText: 'SIGN IN',

                    child: SizedBox(
                      height: 0,
                    )),
                // controller.showSpinner.value == true ? Center(child: CircularProgressIndicator()) :


                ////////////////////////////////////////////////////////////////////////////////////////////////////////////
                orDivider(width: 0.06),
                SizedBox(
                  height: height * 0.01,
                ),



                ////////////////////////////////////////SOCIAL SIGNING////////////////////////////////////////////////////

                /////////////////////////////////////////////fACEBOOK//////////////////////////////////////////////
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    border: Border.all(color: Colors.grey),
                    shape: BoxShape.rectangle,
                  ),
                  child: ListTile(
                    onTap: ()  {
                      print('sign in facebook');

                      controller.facebookSignInMethod();
                    },
                    title: Text('Sign In With Facebook'),
                    leading: Padding(
                      padding: EdgeInsets.only(left: 5),
                      child: Image.asset(
                        "assets/icons/Icon_Facebook.png",
                      ),
                    ),
                    trailing: Icon(Icons.login_rounded),

                  ),
                ),


                SizedBox(
                  height: height * 0.025,
                ),


                /////////////////////////////////////////////GOOGLE//////////////////////////////////////////////
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    border: Border.all(color: Colors.grey),
                    shape: BoxShape.rectangle,
                  ),
                  child: ListTile(
                    onTap: () {
                      print('sign in google');
                      controller.googleSignInMethod();
                    },
                    title: Text('Sign In With Google'),
                    leading: Image.asset(
                      "assets/icons/icons8_Google_2.png",
                      width: 33,
                    ),
                    trailing: Icon(Icons.login_rounded),
                  ),
                ),
                SizedBox(height: 30,),

              ]),
            ),
        ),
      ),
          )



    );



  }


}
