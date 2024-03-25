import 'dart:convert';

import 'package:transfer_flutter/models/user_model.dart';
import 'package:logger/logger.dart';
import '../NetworkHandler.dart';

class UserRepository{
  var logger = Logger();
  UserListData? userModelListData;
  NetworkHandler networkHandler = NetworkHandler();

  Future<List<User>> fetchUsers() async {
    // Assuming you have an API endpoint URL
    var response = await networkHandler.get('/users/get-users');

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      if (jsonResponse['success']) {
        List<dynamic> usersJson = jsonResponse['data']['users'];
        List<User> users = usersJson.map((userJson) => User.fromJson(userJson)).toList();
        return users;
      } else {
        throw Exception('Failed to load users');
      }
    } else {
      throw Exception('Failed to load users');
    }
  }




}