class Explore {


  String name, pic;

  Explore ({
    this.name,this.pic
});

factory Explore.fromJson(Map <dynamic, dynamic> json){

    return Explore(
      name: json['name'],
      pic: json['pic']

    );

}

}