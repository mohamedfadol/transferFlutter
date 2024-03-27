import 'package:transfer_flutter/blocs.transactions/transaction_bloc.dart';
import 'package:transfer_flutter/models/transaction_model.dart';
import 'package:transfer_flutter/pages/widgets/custom_list_tile.dart';
import 'package:transfer_flutter/pages/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants/constant.dart';


class ListTransaction extends StatefulWidget {
  const ListTransaction({super.key});

  @override
  State<ListTransaction> createState() => _ListTransactionState();
}

class _ListTransactionState extends State<ListTransaction> {
  late Color? color = Colors.blue[900];
  TransactionBloc? transactionBloc;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    transactionBloc = BlocProvider.of<TransactionBloc>(context);
  }
  final msg = BlocBuilder<TransactionBloc, TransactionState>(
      builder: (context, state){
        if(state is TransactionErrorState){
          return CustomText(text: state.message);
        }else if(state is TransactionLoadingState){
          return const Center(child: CircularProgressIndicator(color: Colors.green,),);
        }else {
          return Container();
        }
      }
  );
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(text: 'All Transaction'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (BuildContext context, index){
              final TransactionModel transactionModel = transactions[index];
              return GestureDetector(
                onTap: (){
                  transactionBloc!.add(const GetAllTransactionEvent(userId: 1));
                },
                child: Container(
                  // color: Colors.red,
                  padding: const EdgeInsets.only(right: 10.0, left: 10.0, top: 0.0, bottom: 5.0),
                  margin: const EdgeInsets.only(bottom: 2.0),
                  child: CustomListTile(
                    title: CustomText(text: transactionModel.transactionName!, textStyle: const TextStyle(color: Colors.green, fontSize: 12.0, fontWeight: FontWeight.bold)),
                    leading: CircleAvatar(
                      radius: 15.0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: offWhiteColor,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: ClipOval(
                          child: transactionModel.transactionImage!,
                        ),
                      ),
                    ),
                    trailing: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        CustomText(text: transactionModel.transactionTotal!, textStyle: const TextStyle(color: Colors.red, fontSize: 14.0, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 10.0,),
                        CustomText(text: transactionModel.transactionTime!, textStyle: const TextStyle(color: Colors.black45, fontSize: 10.0))
                      ],
                    ),
                    subtitle: CustomText(text: transactionModel.transactionTime!, textStyle: const TextStyle(color: Colors.black45, fontSize: 10.0)),
                  ),
                ),
              );
            }
        ),
      ),
    );
  }
}
