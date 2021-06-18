import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';





class CategoryModel {
  String name, pic;

  CategoryModel({ this.name, this.pic});

  CategoryModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    name = map['name'];
    pic = map['pic'];
  }

  toJson() {
    return {
      'name': name,
      'pic': pic,
    };
  }
}
