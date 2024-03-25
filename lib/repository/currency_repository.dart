import 'dart:convert';

import 'package:logger/logger.dart';

import '../NetworkHandler.dart';
import '../models/Currency.dart';

class CurrencyRepository{
  var logger = Logger();
  CurrencyListData? currencyListData;
  NetworkHandler networkHandler = NetworkHandler();

  Future<List<Currency>> fetchCurrencies() async {
    // Assuming you have an API endpoint URL
    var response = await networkHandler.get('/currencies/get-currencies');

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      if (jsonResponse['success']) {
        List<dynamic> currencyJson = jsonResponse['data']['currencies'];
        List<Currency> users = currencyJson.map((userJson) => Currency.fromJson(userJson)).toList();
        return users;
      } else {
        throw Exception('Failed to load currency');
      }
    } else {
      throw Exception('Failed to load currency');
    }
  }

}