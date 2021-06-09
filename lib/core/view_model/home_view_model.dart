import 'package:get/get.dart';


 import 'package:flutter/material.dart';
import 'package:souq/view/HomeScreen/home_screen.dart';
import 'package:souq/view/cartView/cart_view.dart';
import 'package:souq/view/profileView/profile_view.dart';



class HomeViewModel extends GetxController{
int _navigationValue = 0;


get NavigatorValue => _navigationValue;

// Widget _currentScreen = homeScreen(email: ,);

get currentScreen => _navigationValue;

void changeSelectedValue(int selectedValue){
  _navigationValue = selectedValue;

  // switch(selectedValue){
  //   case 0 : {
  //
  //     _currentScreen = homeScreen();
  //     break;
  //   }
  //   case 1 :{
  //     _currentScreen = Cart();
  //     break;
  //   }
  //   case 2 : {
  //     _currentScreen = profileView();
  //   }
  // }

  update();


}


}