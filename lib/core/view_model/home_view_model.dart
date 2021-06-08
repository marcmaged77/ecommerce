import 'package:get/get.dart';

class HomeViewModel extends GetxController{
int _navigationValue = 0;


get NavigatorValue => _navigationValue;

void changeSelectedValue(int selectedValue){
  _navigationValue = selectedValue;
  update();


}


}