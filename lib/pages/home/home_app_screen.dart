import 'dart:io';

import 'package:transfer_flutter/models/cart_model.dart';
import 'package:transfer_flutter/models/transaction_model.dart';
import 'package:transfer_flutter/pages/home/transaction/list_transaction.dart';
import 'package:transfer_flutter/pages/home/transaction/transaction_details.dart';
import 'package:transfer_flutter/pages/home/transaction/transaction_view.dart';
import 'package:transfer_flutter/pages/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import '../../constants/constant.dart';
import '../../helpers/constants.dart';
import '../../helpers/nav_transition.dart';
import '../widgets/CustomImageWidget.dart';
import '../widgets/custom_list_tile.dart';

class HomeAppScren extends StatefulWidget {
  const HomeAppScren({super.key});

  @override
  State<HomeAppScren> createState() => _HomeAppScrenState();
}

class _HomeAppScrenState extends State<HomeAppScren> {
    var _selectIndex = 0;
    ScrollController scrollController = ScrollController();
    bool closeTopContainer = false;
    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController.addListener(() {
      setState(() {
        closeTopContainer = scrollController.offset > 50;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  final appCard = Container(
    height: 110.0,
    padding: const EdgeInsets.only(bottom: 5.0),
    decoration:  BoxDecoration(
      boxShadow: const [
        BoxShadow(
          color: backGroundColorBackAppBar, // Shadow color
          spreadRadius: 2,
          blurRadius: 5,
          offset: Offset(0, 2), // Changes the position of the shadow
        ),
      ],
      borderRadius: BorderRadius.circular(25.0),
      gradient: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: [0.1, 1.0],
        colors: [
          backGroundColorBackAppBar,
          backGroundColorAppBar,
        ],
      ),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomText(text: 'Today\'s spendings', textStyle: const TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, color: textColor),),
        CustomText(text: '\$ 16.389.43', textStyle: const TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold, color: textColor),),
        TextButton(
          style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 2.0,horizontal: 100.0),
              backgroundColor: backGroundColor,
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5)))
          ),
          onPressed: (){},
          child: CustomText(text: 'Balance', textStyle: const TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, color: backGroundColorAppBar),),
        ),

      ],
    ),
  );

  @override
  Widget build(BuildContext context) {

    final Size size = MediaQuery.of(context).size;
    final heightContainer = MediaQuery.of(context).size.height * 0.30;
    final headerComponent = Container(
      decoration:  BoxDecoration(
        borderRadius: BorderRadius.circular(7.0),
        border: Border.all(
          width: 0.1,
        ),
      ),
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const CustomImageWidget(imagePath: 'assets/icons/discover.svg',width: 15,height: 15,fit: BoxFit.contain,),
              const SizedBox(width: 2.0,),
              CustomText(text: '82.26', textStyle: const TextStyle(fontWeight: FontWeight.bold)),
              const Icon(Icons.arrow_upward_outlined, color: Colors.green,)
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CustomImageWidget(imagePath: 'assets/icons/visa.svg',width: 15,height: 15,fit: BoxFit.contain,),
              const SizedBox(width: 2.0,),
              CustomText(text: '82.26', textStyle: const TextStyle(fontWeight: FontWeight.bold)),
              const Icon(Icons.arrow_downward, color: Colors.red,)
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CustomImageWidget(imagePath: 'assets/icons/mastercard.svg',width: 15,height: 15,fit: BoxFit.contain,),
              const SizedBox(width: 2.0,),
              CustomText(text: '82.26', textStyle: const TextStyle(fontWeight: FontWeight.bold)),
              const Icon(Icons.arrow_upward_outlined, color: Colors.green,)
            ],
          ),
        ],
      ),
    );
    final cartsComponent = SizedBox(
      height: 180,
      child:  AnimatedContainer(
        // color: Colors.deepOrange,
        duration: const Duration(milliseconds: 1000),
        alignment: Alignment.topCenter,
        width: size.width,
        height: closeTopContainer ? 0 : heightContainer,
        child: PageView.builder(
          onPageChanged: (index){ setState(() { _selectIndex = index; }); },
          controller: PageController(viewportFraction: 0.7),
          scrollDirection: Axis.horizontal,
          itemCount: carts.length,
          itemBuilder: (context, index){
            var _scale = _selectIndex == index  ? 1.0 : 0.8;
            return  TweenAnimationBuilder(
              tween: Tween(begin: _scale,end: _scale),
              duration: const Duration(milliseconds: 360),
              curve: Curves.ease,
              child: GestureDetector(
                onTap: (){
                  if (ResponsiveSizes.whichDevice() == ResponsiveSizes.mobile) {
                    Navigator.of(context).push(FadeTransitionRoute(widget:  TransactionDetails(cartModel: carts[index]!,)),);
                  }
                },
                child: Container(
                  decoration:  BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    gradient:  LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: const [0.1, 1.0],
                      colors: [
                        carts[index].color![0]!,
                        carts[index].color![1]!,
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
                                  CustomText(text: carts[index].bankName!, textStyle: const TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),),
                                  const SizedBox(width: 3.0,),
                                  Expanded(child: carts[index].bankLogo!)
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
                                  carts[index].icon!
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              builder: (BuildContext context, value, child) {
                return Transform.scale(scale: value,child: child,);
              },
            );
          },
        ),
      ),
    );

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 15.0, left: 15.0, top: 5.0),
                    child: headerComponent,
                  ),
                  const SizedBox(height: 4.0),
                  cartsComponent,
                  const SizedBox(height: 5.0),
                  // Any other widgets you want to include before the list
                  Padding(
                    padding: const EdgeInsets.only(right: 15.0, left: 15.0, top: 5.0),
                    child: Container(
                      // color: Colors.orange,
                      padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 3.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(text: "Transaction", textStyle: const TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, color: Colors.black),),
                          GestureDetector(
                            onTap: (){
                              Navigator.of(context).push(FadeTransitionRoute(widget:  const ListTransaction()),);
                            },
                            child: Row(
                              children: [
                                CustomText(text: "see more", textStyle: const TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold, color: backGroundColorBackAppBar),),
                                const Icon(Icons.arrow_forward, color: backGroundColorBackAppBar,size: 18.0,),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SliverList(
              delegate: SliverChildBuilderDelegate(
              (BuildContext context, index) {
                    final TransactionModel transaction = transactions[index];
                    return SingleChildScrollView(
                      child: Container(
                      // color: Colors.red,
                      padding: const EdgeInsets.only(right: 10.0, left: 10.0, top: 0.0, bottom: 0.0),
                      margin: const EdgeInsets.only(bottom: 2.0),
                      child: CustomListTile(
                        onTap: () async {
                          if (ResponsiveSizes.whichDevice() == ResponsiveSizes.mobile) {
                               Navigator.of(context).push(FadeTransitionRoute(widget:  TransactionView(transactionModel: transaction)),);
                          }
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
                                        ),
                    );
                },
                childCount: transactions.length, // Your original ListView.builder itemCount
              ),
            ),
          ],
        ),
      ),
    );
  }
 }


