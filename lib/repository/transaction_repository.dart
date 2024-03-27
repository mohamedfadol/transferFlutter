import 'dart:convert';

import 'package:transfer_flutter/models/transaction_model.dart';
import 'package:logger/logger.dart';

import '../NetworkHandler.dart';

class TransactionRepository{

  var logger = Logger();
  NetworkHandler networkHandler = NetworkHandler();
  TransactionModelListData? transactionModelListData;
  Future getAllTransaction(int userId) async
    {
      var data;
      try{
          var body = json.encode({"user_id": userId});
          final response = await  networkHandler.post1('/get-all-user-transaction/$userId', body);
          final data = json.decode(response.body);
          if (response.statusCode == 200 || response.statusCode == 201) {
            var responseData = json.decode(response.body);
            var responseTransactionModelListData = responseData['data'];
            transactionModelListData = TransactionModelListData.fromJson(responseTransactionModelListData);
            logger.d(transactionModelListData!.transactionsList!.length);
            return {"success": responseData["success"] , "message": responseData["message"], data: transactionModelListData!.transactionsList};
          } else {
            logger.e(data["message"]);
            return {"success": data["success"], "message": data["message"]};
          }
        }catch (error) {
          // Handle network errors
          logger.e(error);
        }
      return data;
    }


  makeTransaction(Map<String, dynamic> dataRequest) async{

    try{
      final response = await  networkHandler.post1('/make-transaction', dataRequest);
      final responseData = json.decode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        logger.d('response statusCode == 200');

        var responseTransactionModelListData = responseData['data'];
        logger.d(responseData);
        //********************** there a problem here form model null value ****************************
        transactionModelListData = TransactionModelListData.fromJson(responseTransactionModelListData);
        logger.d(transactionModelListData!.transactionsList!.length);
        return {"success": responseData["success"] , "message": responseData["message"], "data": transactionModelListData};
      } else {
        logger.e(responseData["message"]);
        return {"success": responseData["success"], "message": responseData["message"]};
      }
    }catch (error) {
      // Handle network errors
      logger.e(error);
    }
    return {"success": false, "message": "An error occurred"};
  }

}