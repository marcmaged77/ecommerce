class ProductModel{


  String pic, name, description, price ,reviews;

  ProductModel({this.pic, this.name,this.description,this.price, this.reviews});


  ProductModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    reviews = map['reviews'];
    pic = map['pic'];
    name = map['name'];
    description = map ['description'];
    price = map ['price'];
  }

  toJson() {
    return {
      'reviews' : reviews,
      'name': name,
      'pic': pic,
      'description':description,
      'price': price,


    };
  }

}