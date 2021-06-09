import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:souq/core/view_model/auth_view_model.dart';
import 'package:souq/core/view_model/home_view_model.dart';
import 'package:souq/view/HomeScreen/home_screen.dart';
import 'package:souq/view/LoginPage/loginScreen.dart';
import 'package:souq/view/profileView/profile_view.dart';

import 'cartView/cart_view.dart';




class ControlView extends GetWidget<AuthViewModel> {


  @override
  Widget build(BuildContext context) {


    return Obx( (){

      return (Get.find<AuthViewModel>().name != null)

          ? GetBuilder<HomeViewModel>(
            builder:(controller)=>  Scaffold(
            bottomNavigationBar: bottomNavigationBar(),

            body: controller.currentScreen),
          )
           : LoginScreen();



    });

  }



  bottomNavigationBar() {

    return GetBuilder<HomeViewModel>(
      init: HomeViewModel(),
      builder: (controller) =>
          BottomNavigationBar(





            items: [

              BottomNavigationBarItem(

                // activeIcon:Text("Explore") ,



                  label: '',

                  icon: Padding(
                    padding: EdgeInsets.only(top: 10),

                    child: Image.asset('assets/homeview/Explore.png',fit: BoxFit.contain,

                      width: 35,),
                  )),



              BottomNavigationBarItem(

                  activeIcon:Text("Cart") ,



                  label: '',



                  icon: Padding(
                    padding: EdgeInsets.only(top: 10),

                    child: Image.asset('assets/homeview/Icon_Cart.png',fit: BoxFit.contain,

                      width: 20,),
                  )),



              BottomNavigationBarItem(

                  activeIcon:Text("Account") ,



                  label: '',



                  icon: Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Image.asset('assets/homeview/Icon_User.png',fit: BoxFit.contain,

                      width: 20,),
                  )),

            ],

            currentIndex: controller.NavigatorValue,

            onTap: (index){
              controller.changeSelectedValue(index);


              print(index);
        },
            selectedItemColor: Colors.black,
            backgroundColor: Colors.grey.shade50,

          ),
    );

  }



}


