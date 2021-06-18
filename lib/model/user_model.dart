
class UserModel {
   String userId, email, name;
   String pic;

  UserModel({ this.email,  this.userId, this.name,  this.pic});







  UserModel.fromJson(Map<dynamic, dynamic> map) {
    // ignore: unnecessary_null_comparison
    if (map == null) {
      return;
    }
    userId = map['userId'];
    email = map["email"];
    name = map['name'];
    pic = map['pic'];
  }

  toJson() {
    return {
      userId: 'userId',
      email: 'email',
      name: 'name',
      pic: 'pic',
    };
  }
}
