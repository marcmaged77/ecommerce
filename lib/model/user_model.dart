
class UserModel {
  late String userId, email, name;
  late String? pic;

  UserModel({required this.email, required this.userId,required this.name, required this.pic});







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
