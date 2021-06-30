import 'package:flutter/material.dart';
import 'package:souq/model/reviews.dart';

import 'package:souq/model/reviews.dart';



class Product {

  String name;
  String description;
  String pic;
  String price;
  String review;

  List<Product> reviews;


  Product({


    this.name,
    this.pic,
    this.description,
    this.price,
    this.review,
    this.reviews,

});


  factory Product.fromJson(Map <dynamic, dynamic> json ){

    return Product(
      name: json['name'],
      pic: json['pic'],
      description: json['description'],
      price: json['price'],
      reviews: Reviews.fromJsonArray(json['reviews']),

    );


  }



}