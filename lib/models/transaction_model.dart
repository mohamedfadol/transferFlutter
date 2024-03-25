import 'package:transfer_flutter/models/cart_model.dart';
import 'package:flutter/cupertino.dart';

import '../pages/widgets/CustomImageWidget.dart';


class TransactionModelListData{
  List<TransactionModel>? transactionsList;

  TransactionModelListData.fromJson(Map<String, dynamic> json) {
    if (json['transactions'] != null) {
      transactionsList = <TransactionModel>[];
      json['transactions'].forEach((v) {
        transactionsList!.add(TransactionModel.fromJson(v));
      });
    }
  }
}


class TransactionModel{
  int? transactionId;
  String? transactionName;
  String? transactionTotal;
  String? transactionTime;
  String? transactionCompany;
  String? transactionCreateBy;
  String? transactionAccount;
  Widget? transactionImage;
  CartModel? cartModel;


  TransactionModel(
      {this.transactionId,
      this.transactionName,
      this.transactionTotal,
      this.transactionTime,
      this.transactionCompany,
      this.transactionImage,
      this.transactionCreateBy,
        this.transactionAccount,
      this.cartModel});


  // create new converter
  TransactionModel.fromJson(Map<String, dynamic> json) {
    transactionId = json['id'];
    transactionName = json['status'];
    transactionTotal = json['final_total'];
    transactionTime = json['status'];
    transactionCompany = json['status'];
    transactionImage = const CustomImageWidget(imagePath: 'assets/icons/visa.svg',width: 30,height: 30,fit: BoxFit.contain,);
    transactionCreateBy = json['status'];
    transactionAccount = json['status'];
    // cartModel = json['board'] != null ? CartModel.fromJson(json['board']) : null;
  }

}


List<TransactionModel> transactions = [
   TransactionModel(
       transactionId: 1,
       transactionName: 'Shopping',
       transactionTotal: '\$ 16.389.43',
       transactionTime : '2024 11:31',
       transactionCompany: 'STC',
       transactionImage: const CustomImageWidget(imagePath: 'assets/icons/visa.svg',width: 30,height: 30,fit: BoxFit.contain,),
       cartModel:   CartModel(cartId: 1,),
   ),
   TransactionModel(
       transactionId: 2,
       transactionName: 'Exchange',
       transactionTotal: '\$ 16.389.43',
       transactionTime : '2024 11:31',
       transactionCompany: 'TeePay',
       transactionImage: const CustomImageWidget(imagePath: 'assets/icons/discover.svg',width: 30,height: 30,fit: BoxFit.contain,),
      cartModel:   CartModel(cartId: 2,),
   ),
   TransactionModel(
       transactionId: 3,
       transactionName: 'Online Shopping',
       transactionTotal: '\$ 16.389.43',
       transactionTime : '2024 11:31',
       transactionCompany: 'Chi',
       transactionImage: const CustomImageWidget(imagePath: 'assets/icons/paypal.svg',width: 30,height: 30,fit: BoxFit.contain,),
      cartModel:   CartModel(cartId: 3,),
   ),
   TransactionModel(
       transactionId: 4,
       transactionName: 'Delivery',
       transactionTotal: '\$ 16.389.43',
       transactionTime : '2024 11:31',
       transactionCompany: 'STC',
       transactionImage: const CustomImageWidget(imagePath: 'assets/icons/card-payment.svg',width: 30,height: 30,fit: BoxFit.contain,),
      cartModel:   CartModel(cartId: 4,),
   ),
   TransactionModel(
       transactionId: 5,
       transactionName: 'Transfer',
       transactionTotal: '\$ 16.389.43',
       transactionCompany: 'TeePay',
       transactionTime : '2024 11:31',
       transactionImage: const CustomImageWidget(imagePath: 'assets/icons/unionpay.svg',width: 30,height: 30,fit: BoxFit.contain,),
      cartModel:   CartModel(cartId: 5,),
   ),
   TransactionModel(
       transactionId: 6,
       transactionName: 'Shopping',
       transactionTotal: '\$ 16.389.43',
       transactionTime : '2024 11:31',
       transactionCompany: 'Chi',
       transactionImage: const CustomImageWidget(imagePath: 'assets/icons/bitcoin-cryptocurrency.svg',width: 30,height: 30,fit: BoxFit.contain,),
      cartModel:   CartModel(cartId: 6,),
   ),
   TransactionModel(
       transactionId: 7,
       transactionName: 'Shopping',
       transactionTotal :'\$ 16.389.43',
       transactionTime : '2024 11:31',
       transactionCompany: 'STC',
       transactionImage: const CustomImageWidget(imagePath: 'assets/icons/visa.svg',width: 30,height: 30,fit: BoxFit.contain,),
      cartModel:   CartModel(cartId: 1,),
   ),
   TransactionModel(
       transactionId: 8,
       transactionName: 'Exchange',
       transactionTotal: '\$ 16.389.43',
       transactionTime : '2024 11:31',
       transactionCompany: 'TeePay',
       transactionImage: const CustomImageWidget(imagePath: 'assets/icons/unionpay.svg',width: 30,height: 30,fit: BoxFit.contain,),
      cartModel:   CartModel(cartId: 2,),
   ),
   TransactionModel(
       transactionId: 9,
       transactionName: 'Online Shopping',
       transactionTotal : '\$ 16.389.43',
       transactionTime : '2024 11:31',
       transactionCompany : 'Chi',
       transactionImage: const CustomImageWidget(imagePath: 'assets/icons/card-payment.svg',width: 30,height: 30,fit: BoxFit.contain,),
      cartModel:   CartModel(cartId: 3,),
   ),
   TransactionModel(
       transactionId: 10,
       transactionName: 'Delivery',
       transactionTotal : '\$ 16.389.43',
       transactionTime : '2024 11:31',
       transactionCompany: 'STC',
       transactionImage: const CustomImageWidget(imagePath: 'assets/icons/bitcoin-cryptocurrency.svg',width: 30,height: 30,fit: BoxFit.contain,),
      cartModel:   CartModel(cartId: 4,),
   ),
   TransactionModel(
       transactionId: 11,
       transactionName: 'Transfer',
       transactionTotal: '\$ 16.389.43',
       transactionTime : '2024 11:31',
       transactionCompany: 'TeePay',
       transactionImage: const CustomImageWidget(imagePath: 'assets/icons/paypal.svg',width: 30,height: 30,fit: BoxFit.contain,),
      cartModel:   CartModel(cartId: 5,),
   ),
   TransactionModel(
       transactionId: 12,
       transactionName: 'Shopping',
       transactionTotal: '\$ 16.389.43',
       transactionTime : '2024 11:31',
       transactionCompany: 'Chi',
       transactionImage: const CustomImageWidget(imagePath: 'assets/icons/bitcoin-cash-money.svg',width: 30,height: 30,fit: BoxFit.contain,),
      cartModel:   CartModel(cartId: 6,),
   ),
   TransactionModel(
       transactionId: 13,
       transactionName: 'Shopping',
       transactionTotal: '\$ 16.389.43',
       transactionTime : '2024 11:31',
       transactionCompany: 'STC',
       transactionImage: const CustomImageWidget(imagePath: 'assets/icons/discover.svg',width: 30,height: 30,fit: BoxFit.contain,),
      cartModel:   CartModel(cartId: 4,),
   ),
   TransactionModel(
       transactionId: 14,
       transactionName: 'Exchange',
       transactionTotal: '\$ 16.389.43',
       transactionTime : '2024 11:31',
       transactionCompany: 'TeePay',
       transactionImage:  const CustomImageWidget(imagePath: 'assets/icons/mastercard.svg',width: 30,height: 30,fit: BoxFit.contain,),
      cartModel:   CartModel(cartId: 3,),
   ),
   TransactionModel(
       transactionId: 15,
       transactionName: 'Online Shopping',
       transactionTotal: '\$ 16.389.43',
       transactionTime : '2024 11:31',
       transactionCompany: 'Chi',
       transactionImage: const CustomImageWidget(imagePath: 'assets/icons/discover.svg',width: 30,height: 30,fit: BoxFit.contain,),
      cartModel:   CartModel(cartId: 1,),
   ),
   TransactionModel(
       transactionId: 16,
       transactionName: 'Delivery',
       transactionTotal: '\$ 16.389.43',
       transactionTime : '2024 11:31',
       transactionCompany: 'STC',
       transactionImage: const CustomImageWidget(imagePath: 'assets/icons/card-payment.svg',width: 30,height: 30,fit: BoxFit.contain,),
      cartModel:   CartModel(cartId: 1,),
   ),
   TransactionModel(
       transactionId: 17,
       transactionName: 'Transfer',
       transactionTotal: '\$ 16.389.43',
       transactionTime : '2024 11:31',
       transactionCompany: 'TeePay',
       transactionImage: const CustomImageWidget(imagePath: 'assets/icons/discover.svg',width: 30,height: 30,fit: BoxFit.contain,),
      cartModel:   CartModel(cartId: 2,),
   ),
   TransactionModel(
       transactionId: 18,
       transactionName: 'Shopping',
       transactionTotal: '\$ 16.389.43',
       transactionTime : '2024 11:31',
       transactionCompany: 'Chi',
       transactionImage:  const CustomImageWidget(imagePath: 'assets/icons/unionpay.svg',width: 30,height: 30,fit: BoxFit.contain,),
      cartModel:   CartModel(cartId: 2,),
   ),
];