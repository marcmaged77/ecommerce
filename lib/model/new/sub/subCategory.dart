import 'package:flutter/material.dart';
import 'package:souq/model/new/categoryModel.dart';
import 'package:souq/model/new/sub/products.dart';





class SubCategory extends Category {

  String name;
  String cover;
  List<SubCategory> products;

  SubCategory({
    this.name,
    this.cover,
    this.products
});

  factory SubCategory.fromJson(Map<String, dynamic> json){
    return SubCategory(
      name: json['name'],
      cover: json['cover'],
      products: ProductArray.fromJsonArray(json['products'])



    );

  }

  static List<SubCategory> fromJsonArray(List<dynamic>jsonArray){
    List<SubCategory> reviewsFromJson = [];
    jsonArray.forEach((jsonData) {
      reviewsFromJson.add(SubCategory.fromJson(jsonData));


    });


    return reviewsFromJson;
  }



}