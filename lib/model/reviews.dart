import 'package:flutter/material.dart';
import 'package:souq/model/products_mode.dart';

class Reviews extends ProductModel {
  Reviews({
    String name,
    String pic,
    String review,
    int stars,
    DateTime date,
  }) ;






  factory Reviews.fromJson(Map<dynamic, dynamic> json){
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
