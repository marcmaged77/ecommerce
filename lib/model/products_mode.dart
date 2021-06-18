class ProductModel{


  String pic, name, description, price ;

  ProductModel({this.pic, this.name,this.description,this.price});


  ProductModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    pic = map['pic'];
    name = map['name'];
    description = map ['description'];
    price = map ['price'];
  }

  toJson() {
    return {
      'name': name,
      'pic': pic,
      'description':description,
      'price': price,


    };
  }

}