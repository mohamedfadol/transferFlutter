import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import 'constants/constant.dart';

class NetworkHandler {
  String baseurl = transactionUrl;
  var log = Logger();
  FlutterSecureStorage storage = const FlutterSecureStorage();

  Future<http.Response> get(String url) async {
    String token = (await storage.read(key: "token"))!;
    url = formater(url);
    var response = await http.get(
      Uri.parse(url),
      headers: {
        "Accept": "application/json",
        "Content-type": "application/json",
        "Authorization": "Bearer $token",
        "Connection": "Keep-Alive"
      },
    );
    // print(json.decode(response.body));
    log.i(response.statusCode);
    return response;
  }

  Future<http.Response> post(String url, Map<String, String> body) async {
    String token = (await storage.read(key: "token"))!;
    url = formater(url);
    var response = await http.post(
      Uri.parse(url),
      headers: {
        "Accept": "application/json",
        "Content-type": "application/json",
        "Authorization": "Bearer $token",
        "Connection": "Keep-Alive"
      },
      body: json.encode(body),
    );
    // log.d(json.decode(response.body));
    return response;
  }

  Future<http.Response> patch(String url, Map<String, String> body) async {
    String token = (await storage.read(key: "token"))!;
    url = formater(url);
    log.d(body);
    var response = await http.patch(
      Uri.parse(url),
      headers: {
        "Content-type": "application/json",
        "Authorization": "Bearer $token",
        "Connection": "Keep-Alive"
      },
      body: json.encode(body),
    );
    return response;
  }

  Future<http.Response> post1(String url, var body) async {
    String token = (await storage.read(key: "token"))!;
    url = formater(url);
    // log.d(body);
    var response = await http.post(
      Uri.parse(url),
      headers: {
        "Accept": "application/json",
        "Content-type": "application/json; charset=UTF-8",
        "Authorization": "Bearer $token",
        "Connection": "Keep-Alive"
      },
      body: json.encode(body),
    );
    return response;
  }

  Future<http.Response> post2(String url, var body) async {
    url = formater(url);
    // log.d(body);
    var response = await http.post(
      Uri.parse(url),
      headers: {
        "Accept": "application/json",
        "Content-type": "application/json; charset=UTF-8",
        "Connection": "Keep-Alive"
      },
      body: json.encode(body),
    );
    return response;
  }

  String formater(String url) {
    return baseurl + url;
  }

}