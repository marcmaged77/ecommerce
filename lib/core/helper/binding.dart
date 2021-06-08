




import 'package:get/get.dart';
import 'package:souq/core/view_model/auth_view_model.dart';
import 'package:souq/core/view_model/home_view_model.dart';

class Binding extends Bindings{

  @override


  void dependencies() {
    
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => HomeViewModel());



  }






}