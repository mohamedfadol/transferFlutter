import 'package:transfer_flutter/models/cart_model.dart';
import 'package:transfer_flutter/models/transaction_model.dart';
import 'package:transfer_flutter/pages/transaction/transaction_view.dart';
import 'package:transfer_flutter/pages/transaction/transfer_transaction.dart';
import 'package:flutter/material.dart';

import '../../../constants/constant.dart';
import '../../../helpers/nav_transition.dart';
import '../widgets/custom_list_tile.dart';
import '../widgets/custom_text.dart';
class TransactionDetails extends StatelessWidget {
    final CartModel cartModel ;
   const TransactionDetails({super.key, required this.cartModel});

   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
           titleSpacing: 0.0,
           automaticallyImplyLeading: false,
           leadingWidth: 35,
           centerTitle: false,
           leading: const BackButton(color: iconColor,),
           elevation: 2.0,
           bottom: const PreferredSize(
             preferredSize: Size.fromHeight(-18.0), // i want to set second AppBar's height
             child: SizedBox(),
           ),
           title: CustomText(text: 'Transaction Details',textStyle: const TextStyle(color: textColor, fontSize: 15.0, fontWeight: FontWeight.bold),),
       ),
       body: SafeArea(
         child: CustomScrollView(
           slivers: <Widget>[
              SliverToBoxAdapter(
               child: Padding(
                 padding: const EdgeInsets.only(right: 40, left: 40, top: 10.0, bottom: 10.0),
                  child: Container(
                    height: 200,
                    decoration:  BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      gradient:  LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: const [0.1, 1.0],
                        colors: [
                          cartModel.color![0]!,
                          cartModel.color![1]!,
                        ],
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  CustomText(text: '8548 ...', textStyle: const TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold, color: textColor),),
                                  CustomText(text: 'Mohamed Fadl Elbary', textStyle: const TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold, color: textColor),),
                                ],
                              ),
                            )
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0, top: 8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    CustomText(text: cartModel.bankName!, textStyle: const TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),),
                                    const SizedBox(width: 3.0,),
                                    Expanded(child: cartModel.bankLogo!)
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right:8.0, bottom: 8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    cartModel.icon!
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
               ),
             ),
              SliverList(
               delegate: SliverChildBuilderDelegate(
                     (BuildContext context, index) {
                    final TransactionModel transaction =   cartModel!.transactions![index]!;
                   return Container(
                     // color: Colors.red,
                     padding: const EdgeInsets.only(right: 10.0, left: 10.0, top: 0.0, bottom: 5.0),
                     margin: const EdgeInsets.only(bottom: 2.0),
                     child: CustomListTile(
                       onTap: (){
                         Navigator.of(context).push(FadeTransitionRoute(widget:  TransactionView(transactionModel: transaction)),);
                       },
                       title: CustomText(text: transaction.transactionName!, textStyle: const TextStyle(color: Colors.green, fontSize: 12.0, fontWeight: FontWeight.bold)),
                       leading: CircleAvatar(
                         radius: 15.0,
                         child: Container(
                           decoration: BoxDecoration(
                             color: offWhiteColor,
                             borderRadius: BorderRadius.circular(5.0),
                           ),
                           child: ClipOval(
                             child: transaction.transactionImage!,
                           ),
                         ),
                       ),
                       trailing: Column(
                         mainAxisSize: MainAxisSize.max,
                         children: [
                           CustomText(text: transaction.transactionTotal!, textStyle: const TextStyle(color: Colors.red, fontSize: 14.0, fontWeight: FontWeight.bold)),
                           const SizedBox(height: 10.0,),
                           CustomText(text: transaction.transactionTime!, textStyle: const TextStyle(color: Colors.black45, fontSize: 10.0))
                         ],
                       ),
                       subtitle: CustomText(text: transaction.transactionTime!, textStyle: const TextStyle(color: Colors.black45, fontSize: 10.0)),
                     ),
                   );
                 },
                 childCount: cartModel!.transactions!.length, // Your original ListView.builder itemCount
               ),
             ),
           ],
         ),
       ),

         floatingActionButton: FloatingActionButton(
           backgroundColor: backGroundColorBackAppBar,
           onPressed: (){
             Navigator.of(context).push(FadeTransitionRoute(widget:  TransferTransaction(cartModel: cartModel)),);
           },
           child: const Icon(Icons.wallet_travel_outlined, color: iconColor,),
         )
     );
   }
 }
