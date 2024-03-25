import 'dart:convert';

class UserListData{
  List<User>? userList;

  UserListData.fromJson(Map<String, dynamic> json) {
    if (json['users'] != null) {
      userList = <User>[];
      json['users'].forEach((v) {
        userList!.add(User.fromJson(v));
      });
    }
  }
}

UserModel  userFromJson(String user) => UserModel.formJsonToObject(json.decode(user));
class UserModel {
  User user;
  String token;

  UserModel({ required this.user,required this.token});
  factory UserModel.formJsonToObject(Map<String, dynamic> json) =>
      UserModel(
          user: User.fromJson(json['user']),
          token: json['token']
      );

  Map<String,dynamic> toJson() => {
    // return form User  toJson function
    "user": user.toJson(),
    "token": token
  };

}
// to create constructor of UserModel use below code
// user = UserModel(String user, String token);

class User{
  final int? userId;
  final String? name;
  final String? email;

  User({this.userId, this.name, this.email});

  // create new converter
  factory User.fromJson(Map<String, dynamic> json) =>
      User(
          userId: json['id'],
          name: json['name'],
          email: json['email'],
      );

  Map<String,dynamic> toJson() => {
    "id": userId,
    "name": name,
    "email": email
  };

}