




import 'package:get/get.dart';
import 'package:souq/core/view_model/auth_view_model.dart';
import 'package:souq/core/view_model/home_view_model.dart';
import 'package:souq/model/category_model.dart';
import 'package:souq/model/products_mode.dart';

class Binding extends Bindings{

  @override


  void dependencies() {
    
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => HomeViewModel());
    Get.lazyPut(() => CategoryModel());
    Get.lazyPut(() => ProductModel());

  }






}