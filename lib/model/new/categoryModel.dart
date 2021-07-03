import 'package:flutter/material.dart';
import 'package:souq/model/new/sub/subCategory.dart';

class Category {



  String name, pic,cover,description,price;


  List<Category> subCategory;
  List<SubCategory> products;

  Category({
    this.name,
    this.pic,
    this.cover,
    this.subCategory,
    this.products,
    this.description,
    this.price,



  });




  factory Category.fromJson(Map <dynamic, dynamic> json){

    return Category(
      name: json['name'],
      pic: json['pic'],
      cover: json['cover'],
      subCategory: SubCategory.fromJsonArray(json['subCategory']),

    );

  }









}
