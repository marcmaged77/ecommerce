import 'package:souq/model/reviews.dart';

class ProductModel {
  List<ProductModel> reviews;

  String pic, name, description, price;
      // review;
  // DateTime date;
  // int stars;

  // reviews;

  ProductModel({
    this.pic,
    this.name,
    this.description,
    this.price,
    this.reviews,
  });

  factory ProductModel.fromJson(Map<dynamic, dynamic> map) {
    return ProductModel(
        pic: map['pic'],
        name: map['name'],
        description: map['description'],
        price: map['price'],
        reviews: List.from(map['reviews'])
        // reviews: Reviews.fromJsonArray(map['reviews'])

    );

    // if (map == null) {
    //   return;
    // }
    // pic = map['pic'];
    // name = map['name'];
    // description = map ['description'];
    // price = map ['price'];
    // reviews =
    // // reviews = map ['reviews'];
  }

  toJson() {
    return {
      'name': name,
      'pic': pic,
      'description': description,
      'price': price,
      // 'reviews': reviews,
    };
  }
}
