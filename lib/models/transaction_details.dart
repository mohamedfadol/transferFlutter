import 'package:flutter/cupertino.dart';

import '../pages/widgets/CustomImageWidget.dart';


class TransactionDetails{
  int? transactionId;
  String? transactionName;
  String? transactionTotal;
  String? transactionTime;
  Widget? transactionImage;

  TransactionDetails(this.transactionId, this.transactionName, this.transactionTotal, this.transactionTime, this.transactionImage);
}

List<TransactionDetails> transactions = [
  TransactionDetails(1, 'Shopping', '\$ 16.389.43', 'STC', const CustomImageWidget(imagePath: 'assets/icons/visa.svg',width: 30,height: 30,fit: BoxFit.contain,)),
  TransactionDetails(2, 'Exchange', '\$ 16.389.43', 'TeePay', const CustomImageWidget(imagePath: 'assets/icons/discover.svg',width: 30,height: 30,fit: BoxFit.contain,)),
  TransactionDetails(6, 'Online Shopping', '\$ 16.389.43', 'Chi', const CustomImageWidget(imagePath: 'assets/icons/paypal.svg',width: 30,height: 30,fit: BoxFit.contain,)),
  TransactionDetails(1, 'Delivery', '\$ 16.389.43', 'STC', const CustomImageWidget(imagePath: 'assets/icons/card-payment.svg',width: 30,height: 30,fit: BoxFit.contain,)),
  TransactionDetails(2, 'Transfer', '\$ 16.389.43', 'TeePay', const CustomImageWidget(imagePath: 'assets/icons/unionpay.svg',width: 30,height: 30,fit: BoxFit.contain,)),
  TransactionDetails(6, 'Shopping', '\$ 16.389.43', 'Chi', const CustomImageWidget(imagePath: 'assets/icons/bitcoin-cryptocurrency.svg',width: 30,height: 30,fit: BoxFit.contain,)),
  TransactionDetails(1, 'Shopping', '\$ 16.389.43', 'STC', const CustomImageWidget(imagePath: 'assets/icons/visa.svg',width: 30,height: 30,fit: BoxFit.contain,)),
  TransactionDetails(2, 'Exchange', '\$ 16.389.43', 'TeePay', const CustomImageWidget(imagePath: 'assets/icons/unionpay.svg',width: 30,height: 30,fit: BoxFit.contain,)),
  TransactionDetails(6, 'Online Shopping', '\$ 16.389.43', 'Chi', const CustomImageWidget(imagePath: 'assets/icons/card-payment.svg',width: 30,height: 30,fit: BoxFit.contain,)),
  TransactionDetails(1, 'Delivery', '\$ 16.389.43', 'STC', const CustomImageWidget(imagePath: 'assets/icons/bitcoin-cryptocurrency.svg',width: 30,height: 30,fit: BoxFit.contain,)),
  TransactionDetails(2, 'Transfer', '\$ 16.389.43', 'TeePay', const CustomImageWidget(imagePath: 'assets/icons/paypal.svg',width: 30,height: 30,fit: BoxFit.contain,)),
  TransactionDetails(6, 'Shopping', '\$ 16.389.43', 'Chi', const CustomImageWidget(imagePath: 'assets/icons/bitcoin-cash-money.svg',width: 30,height: 30,fit: BoxFit.contain,)),
  TransactionDetails(1, 'Shopping', '\$ 16.389.43', 'STC', const CustomImageWidget(imagePath: 'assets/icons/discover.svg',width: 30,height: 30,fit: BoxFit.contain,)),
  TransactionDetails(2, 'Exchange', '\$ 16.389.43', 'TeePay', const CustomImageWidget(imagePath: 'assets/icons/mastercard.svg',width: 30,height: 30,fit: BoxFit.contain,)),
  TransactionDetails(6, 'Online Shopping', '\$ 16.389.43', 'Chi', const CustomImageWidget(imagePath: 'assets/icons/discover.svg',width: 30,height: 30,fit: BoxFit.contain,)),
  TransactionDetails(1, 'Delivery', '\$ 16.389.43', 'STC', const CustomImageWidget(imagePath: 'assets/icons/card-payment.svg',width: 30,height: 30,fit: BoxFit.contain,)),
  TransactionDetails(2, 'Transfer', '\$ 16.389.43', 'TeePay', const CustomImageWidget(imagePath: 'assets/icons/discover.svg',width: 30,height: 30,fit: BoxFit.contain,)),
  TransactionDetails(6, 'Shopping', '\$ 16.389.43', 'Chi', const CustomImageWidget(imagePath: 'assets/icons/unionpay.svg',width: 30,height: 30,fit: BoxFit.contain,)),
];