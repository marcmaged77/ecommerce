import 'package:flutter/material.dart';
import 'package:souq/model/new/productModel.dart';

class Reviews extends Product {

String name;
String pic;
String review;

  Reviews({
    this.name,
    this.pic,
    this.review,
  });






  factory Reviews.fromJson(Map<String, dynamic> json){
    return Reviews(
      name: json['name'],
      pic: json['pic'],
      review: json['review'],

    );

  }




  static List<Reviews> fromJsonArray(List<dynamic>jsonArray){
    List<Reviews> reviewsFromJson = [];
jsonArray.forEach((jsonData) {
  reviewsFromJson.add(Reviews.fromJson(jsonData));


});


  return reviewsFromJson;
  }


}
