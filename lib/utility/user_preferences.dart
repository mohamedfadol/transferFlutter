import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

import '../models/user_model.dart';

class UserPreferences {

  Future<bool> saveUser(UserModel user) async {
    const FlutterSecureStorage storage = FlutterSecureStorage();
    await storage.write(key: "token", value: user.token);
    await storage.write(key: "user", value: json.encode(user.user!));
    await storage.write(key: "id", value: json.encode(user.user.userId!));
    await storage.write(key: "name", value: json.encode(user.user.name!));
    await storage.write(key: "email", value: json.encode(user.user.email!));
    return true;
  }


  Future<UserModel> getAuthUser ()  async {
    const FlutterSecureStorage storage = FlutterSecureStorage();
    String token = (await storage.read(key: "token"))!;
    User user = User.fromJson(jsonDecode(json.encode(await storage.read(key: "user")!))) ;
    return UserModel (user: user,token: token);
  }

  void removeUser() async {
    const FlutterSecureStorage storage = FlutterSecureStorage();
    await storage.delete(key: "token");
    await storage.delete(key: "user");
    await storage.delete(key: "id");
    await storage.delete(key: "name");
    await storage.delete(key: "email");
  }

  Future<String> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token")!;
    return token;
  }

  Future<User> getInfo() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    User user =  User.fromJson(json.decode(prefs.getString("user")!)) ;
    return user;
  }
}