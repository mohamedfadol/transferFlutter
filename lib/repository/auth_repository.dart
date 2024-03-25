import 'dart:convert';

import 'package:transfer_flutter/models/user_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import '../NetworkHandler.dart';
import '../constants/constant.dart';
import '../utility/user_preferences.dart';
class AuthRepository{

  var logger = Logger();
  NetworkHandler networkHandler = NetworkHandler();

  login(String email, String password) async{
    // Create storage
    const FlutterSecureStorage storage = FlutterSecureStorage();
    var data;
    try {
         var body = json.encode({"email": email, "password": password});
         Map<String, String> headers = {"Accept": "application/json","Content-Type":"application/json; charset=UTF-8"};
         final response = await
               http.post(
                           Uri.parse('$apiUrl/login'),
                           headers: headers,
                           body: body,
                           encoding: Encoding.getByName("utf-8")
                          );
         final data = json.decode(response.body);
         if (response.statusCode == 200) {
           final res = json.decode(response.body);
           var userData = res['data'];
           var authUser = userFromJson(json.encode(userData));
           await storage.write(key: "token", value: authUser.token);
           await storage.write(key: "user", value: json.encode(authUser.user!));
           UserPreferences().saveUser(authUser);
           return {"success": res["success"] , "message": res["message"], data: authUser.user };
         } else {
           logger.e(data["message"]);
           return {"success": data["success"], "message": data["message"]};
         }
      } catch (error) {
          // Handle network errors
          logger.e(error);
      }
      return data;
  }

  register(String email, String password) async{
    var data;
    try {
            var body = json.encode({"email": email, "password": password});
            Map<String, String> headers = {"Accept": "application/json","Content-Type":"application/json; charset=UTF-8"};
            final response = await
            http.post(
                Uri.parse('$apiUrl/register'),
                headers: headers,
                body: body,
                encoding: Encoding.getByName("utf-8")
            );
            final data = json.decode(response.body);
            if (response.statusCode == 200) {
              final res = json.decode(response.body);
              return {"success": res["success"], "message": res["message"], data: res["data"]};
          } else {
              return {"success": data["success"], "message": data["message"]};
          }
    } catch (error) {
      // Handle network errors
      print('Error: $error');
    }
    return data;
  }



}