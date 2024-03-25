import 'package:transfer_flutter/models/transaction_model.dart';
import 'package:flutter/material.dart';
import '../constants/constant.dart';
import '../pages/widgets/CustomImageWidget.dart';

class CartModel {
  int? cartId;
  Widget? icon;
  Widget? bankLogo;
  String? cartName;
  String? bankName;
  String? cartTotal;
  String? cartSign;
  List<Color?>? color;
  List<TransactionModel>? transactions;
  CartModel({this.cartId,this.icon,this.bankLogo,this.cartName,this.bankName,this.cartTotal,this.cartSign,this.color,this.transactions});
}

// sample data
List<Color> colors = [cart2Color, cart3Color, cartColor, cart1Color, cart4Color , cart5Color];

List<TransactionModel> transactionsList = [
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

List<TransactionModel> rajhibankTransactionsList = [
  TransactionModel(
    transactionId: 1,
    transactionName: 'Shopping',
    transactionTotal: '\$ 16.389.43',
    transactionTime : '2024 11:31',
    transactionCompany: 'STC',
    transactionImage: const CustomImageWidget(imagePath: 'assets/icons/visa.svg',width: 30,height: 30,fit: BoxFit.contain,),
    cartModel:   CartModel(cartId: 6,),
  ),
  TransactionModel(
    transactionId: 2,
    transactionName: 'Exchange',
    transactionTotal: '\$ 16.389.43',
    transactionTime : '2024 11:31',
    transactionCompany: 'TeePay',
    transactionImage: const CustomImageWidget(imagePath: 'assets/icons/discover.svg',width: 30,height: 30,fit: BoxFit.contain,),
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

];

List<TransactionModel> khTransactionsList = [
  TransactionModel(
    transactionId: 1,
    transactionName: 'Shopping',
    transactionTotal: '\$ 16.389.43',
    transactionTime : '2024 11:31',
    transactionCompany: 'STC',
    transactionImage: const CustomImageWidget(imagePath: 'assets/icons/visa.svg',width: 30,height: 30,fit: BoxFit.contain,),
    cartModel:   CartModel(cartId: 6,),
  ),
  TransactionModel(
    transactionId: 2,
    transactionName: 'Exchange',
    transactionTotal: '\$ 16.389.43',
    transactionTime : '2024 11:31',
    transactionCompany: 'TeePay',
    transactionImage: const CustomImageWidget(imagePath: 'assets/icons/discover.svg',width: 30,height: 30,fit: BoxFit.contain,),
    cartModel:   CartModel(cartId: 6,),
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
];

List<TransactionModel> riyadhBanktransactionsList = [
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
];

List<CartModel> carts = [
  CartModel(
      cartId: 1,
      icon: const CustomImageWidget(imagePath: 'assets/icons/mastercard.svg',width: 40,height: 40,fit: BoxFit.contain,),
      bankLogo : const CustomImageWidget(imagePath: 'assets/icons/apigeeapiplatform.svg',width: 40,height: 40,fit: BoxFit.contain,) ,
      bankName: 'Alrajhi Bank',
      cartName: 'Discover',
      cartTotal: '\$ 16.389.43',
      cartSign: 'Disc',
      color: [cart2Color, cart3Color],
      transactions: rajhibankTransactionsList
  ),
  CartModel(
      cartId: 2,
      icon: const CustomImageWidget(imagePath: 'assets/icons/visa.svg',width: 40,height: 40,fit: BoxFit.contain,),
      bankLogo : const CustomImageWidget(imagePath: 'assets/icons/cloud-natural-language-api.svg',width: 40,height: 40,fit: BoxFit.contain,) ,
      bankName: 'Al Riyadh Bank',
      cartName: 'Master Card',
      cartTotal: '\$ 16.389.43',
      cartSign: 'Master Card',
      color: [cartColor, cart1Color],
      transactions: riyadhBanktransactionsList
  ),
  CartModel(
      cartId: 3,
      icon: const CustomImageWidget(imagePath: 'assets/icons/unionpay.svg',width: 40,height: 40,fit: BoxFit.contain,),
      bankLogo: const CustomImageWidget(imagePath: 'assets/icons/data-studio.svg',width: 40,height: 40,fit: BoxFit.contain,) ,
      bankName: 'Nelain Bank',
      cartName: 'Paypal',
      cartTotal: '\$ 16.389.43',
      cartSign: 'PayPal',
      color: [cart4Color, cart5Color],
      transactions: riyadhBanktransactionsList
  ),
  CartModel(
      cartId: 4,
      icon: const CustomImageWidget(imagePath: 'assets/icons/apple.svg',width: 40,height: 40,fit: BoxFit.contain,),
      bankLogo: const CustomImageWidget(imagePath: 'assets/icons/dataproc.svg',width: 40,height: 40,fit: BoxFit.contain,) ,
      bankName: 'Faisal Bank',
      cartName: 'Card Payment',
      cartTotal: '\$ 16.389.43',
      cartSign: 'Card-Pay',
      color: [cart2Color, cart3Color],
      transactions: transactionsList
  ),
  CartModel(
      cartId: 5,
      icon: const CustomImageWidget(imagePath: 'assets/icons/bitcoin-cash-money.svg',width: 40,height: 40,fit: BoxFit.contain,),
      bankLogo: const CustomImageWidget(imagePath: 'assets/icons/dialogflow.svg',width: 40,height: 40,fit: BoxFit.contain,) ,
      bankName: 'Sudan Bank',
      cartName: 'Union Pay',
      cartTotal: '\$ 16.389.43',
      cartSign: 'UnionPay',
      color: [cartColor, cart1Color],
      transactions: transactionsList
  ),
  CartModel(
      cartId: 6,
      icon: const CustomImageWidget(imagePath: 'assets/icons/visa.svg',width: 40,height: 40,fit: BoxFit.contain,),
      bankLogo: const CustomImageWidget(imagePath: 'assets/icons/text-to-speech.svg',width: 40,height: 40,fit: BoxFit.contain,) ,
      bankName: 'Khartoum',
      cartName: 'Bitcoin',
      cartTotal: '\$ 16.389.43',
      cartSign: 'BitCoin',
      color:  [cart4Color, cart5Color],
      transactions: khTransactionsList
  ),
];











//
//
// ChiListView(
// scrollDirection: Axis.horizontal,
// physics: const BouncingScrollPhysics(),
// shrinkWrap: true,
// children: [
// Container(
// width: 300.0,
// decoration:  BoxDecoration(
// borderRadius: BorderRadius.circular(25.0),
// gradient: const LinearGradient(
// begin: Alignment.topCenter,
// end: Alignment.bottomCenter,
// stops: [0.1, 1.0],
// colors: [
// cart2Color,
// cart3Color,
// ],
// ),
// ),
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// mainAxisAlignment: MainAxisAlignment.center,
// mainAxisSize: MainAxisSize.min,
// children: [
// Padding(
// padding: const EdgeInsets.only(left: 15.0),
// child: Row(
// crossAxisAlignment: CrossAxisAlignment.start,
// mainAxisAlignment: MainAxisAlignment.center,
// mainAxisSize: MainAxisSize.min,
// children: [
// const Icon(Icons.currency_bitcoin, color: Colors.deepOrangeAccent,size: 35.0, ),
// const SizedBox(width: 1.0,),
// CustomText(text: 'bitcoin', textStyle: const TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, color: textColor),),
// ],
// ),
// ),
// const SizedBox(height: 2.0,),
// Padding(
// padding: const EdgeInsets.only(left: 25.0),
// child: Row(
// crossAxisAlignment: CrossAxisAlignment.start,
// mainAxisAlignment: MainAxisAlignment.center,
// mainAxisSize: MainAxisSize.min,
// children: [
// CustomText(text: '\$ 16.389.43', textStyle: const TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold, color: textColor),),
// const SizedBox(width: 2.0,),
// CustomText(text: 'STC', textStyle: const TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, color: textColor),),
// ],
// ),
// ),
// ],
// ),
// ),
// const SizedBox(width: 15.0,),
// Container(
// width: 300.0,
// decoration:  BoxDecoration(
// borderRadius: BorderRadius.circular(25.0),
// gradient: const LinearGradient(
// begin: Alignment.topCenter,
// end: Alignment.bottomCenter,
// stops: [0.1, 1.0],
// colors: [
// cartColor,
// cart1Color,
// ],
// ),
// ),
// child: Column(
// children: [
// const Spacer(),
// CustomText(text: 'Today\'s spendings', textStyle: const TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, color: textColor),),
// const SizedBox(height: 20.0,),
// CustomText(text: '\$ 16.389.43', textStyle: const TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold, color: textColor),),
// ],
// ),
// ),
// const SizedBox(width: 15.0,),
// Container(
// width: 300.0,
// decoration:  BoxDecoration(
// borderRadius: BorderRadius.circular(25.0),
// gradient: const LinearGradient(
// begin: Alignment.topCenter,
// end: Alignment.bottomCenter,
// stops: [0.1, 1.0],
// colors: [
// backGroundColorBackAppBar,
// backGroundColorAppBar,
// ],
// ),
// ),
// child: Column(
// children: [
// const Spacer(),
// CustomText(text: 'Today\'s spendings', textStyle: const TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, color: textColor),),
// const SizedBox(height: 20.0,),
// CustomText(text: '\$ 16.389.43', textStyle: const TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold, color: textColor),),
// ],
// ),
// ),
// const SizedBox(width: 15.0,),
// Container(
// width: 300.0,
// decoration:  BoxDecoration(
// borderRadius: BorderRadius.circular(25.0),
// gradient: const LinearGradient(
// begin: Alignment.topCenter,
// end: Alignment.bottomCenter,
// stops: [0.1, 1.0],
// colors: [
// cart4Color,
// cart5Color,
// ],
// ),
// ),
// child: Column(
// children: [
// const Spacer(),
// CustomText(text: 'Today\'s spendings', textStyle: const TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, color: textColor),),
// const SizedBox(height: 20.0,),
// CustomText(text: '\$ 16.389.43', textStyle: const TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold, color: textColor),),
// ],
// ),
// ),
// ],
// )