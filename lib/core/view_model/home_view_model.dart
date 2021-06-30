import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:souq/model/category_model.dart';
import 'package:souq/model/productModel.dart';
import 'package:souq/model/products_mode.dart';
import 'package:souq/view/HomeScreen/home_screen.dart';
import 'package:souq/view/cartView/cart_view.dart';
import 'package:souq/view/profileView/profile_view.dart';

class HomeViewModel extends GetxController {



  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);

  //instance of categories collection of firestore
  final _collectionReference =
      FirebaseFirestore.instance.collection('Categories');

//instance of products collection of firestore
  final _ProductReference = FirebaseFirestore.instance.collection('Products');

  List<Product> _mostSelling = [];
  List<Product> get mostSelling => _mostSelling;
  List<Product> getMostSelling() {
    return _mostSelling;
  }

  Future<void> getMostSellingFirebase() async {
    CollectionReference mostSelling =
        FirebaseFirestore.instance.collection('Product');

    DocumentSnapshot snapshot = await mostSelling.doc('mostSelling').get();

//data is products
    var data = snapshot.data() as Map;
    var productsData = data['products'] as List<dynamic>;

    productsData.forEach((proData) {
      _mostSelling.add(Product.fromJson(proData));
//// isa hateshta3'al
    });
  }

//adding data to the category model
  List<CategoryModel> get categoryModel => _categoryModel;
  List<CategoryModel> _categoryModel = [];

//adding data to the product model
  List<ProductModel> get productModel => _productModel;
  List<ProductModel> _productModel = [];

  HomeViewModel() {
    getCategory();
    // getProduct();
    getMostSellingFirebase();
    getMostSelling();
  }

  getCategory() async {
    _loading.value = true;

    await _collectionReference.get().then((QuerySnapshot value) {
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

// DocumentSnapshot snapshot = await _ProductReference.doc('Products').get();
// var data = snapshot.data() as Map;
// var reviews = data['reviews'];

    await _ProductReference.get().then((QuerySnapshot value) async {
      // DocumentSnapshot snapshot = await _ProductReference.doc('Products').get();
      // var data = snapshot.data() as Map;
      // var reviews = data['reviews'];
      //
      // reviews.forEach((reviewsData)  {
      //
      //
      //
      // });

      for (int i = 0; i < value.docs.length; i++) {
        _productModel.add(ProductModel.fromJson(value.docs[i].data()));
        _loading.value = false;
      }

      print('hellloooooo');
      print(value.docs.length);
      update();
    });
  }
}
