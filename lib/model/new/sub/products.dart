


import 'package:souq/model/new/categoryModel.dart';
import 'package:souq/model/new/sub/subCategory.dart';

class ProductArray extends SubCategory{

  String name, description,price,pic;

  ProductArray({
    this.name,
    this.description,
    this.price,
    this.pic,
});


  factory ProductArray.fromJson(Map <String,dynamic> json){
    return ProductArray(
      name: json['name'],
      description: json['description'],
      price: json['price'],
      pic: json['pic']
    );


  }

static List<ProductArray> fromJsonArray(List<dynamic>jsonArray){
    List<ProductArray> productFromJson = [];
    jsonArray.forEach((jsonData) {
      productFromJson.add(ProductArray.fromJson(jsonData));


    });
return productFromJson;

}

}