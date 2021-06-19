import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';


 import 'package:flutter/material.dart';
import 'package:souq/model/category_model.dart';
import 'package:souq/model/products_mode.dart';
import 'package:souq/view/HomeScreen/home_screen.dart';
import 'package:souq/view/cartView/cart_view.dart';
import 'package:souq/view/profileView/profile_view.dart';



class HomeViewModel extends GetxController{
ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);


  //instance of categories collection of firestore
  final  _collectionReference =
  FirebaseFirestore.instance.collection('Categories') ;


  //instance of products collection of firestore
  final  _ProductReference =
  FirebaseFirestore.instance.collection('Products') ;

//adding data to the category model
  List<CategoryModel> get categoryModel => _categoryModel;
  List<CategoryModel> _categoryModel = [];


//adding data to the product model
  List<ProductModel> get productModel => _productModel;
  List<ProductModel> _productModel = [];

 HomeViewModel() {


   getCategory();
   getProduct();
}

getCategory() async {

  _loading.value = true;


  await  _collectionReference.get().then((QuerySnapshot value) {

    print('getting categories');

      for (int i = 0; i < value.docs.length; i++) {
        _categoryModel.add(CategoryModel.fromJson(value.docs[i].data()));
        _loading.value = false;


      }


      // print(value.docs[0].data());
      // update();
    update();
    });

  }



 getProduct() async {
   _loading.value = true;

   print('getting Products');


   await  _ProductReference.get().then((QuerySnapshot value) {
      for (int i = 0; i < value.docs.length; i++) {
        _productModel.add(ProductModel.fromJson(value.docs[i].data()));
        // print(_productModel.length);
        _loading.value = false;

      }



      // print(value.docs[0].data());
      update();
    });
  }




}