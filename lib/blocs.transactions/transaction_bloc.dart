import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';

import '../repository/transaction_repository.dart';

part 'transaction_event.dart';
part 'transaction_state.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  var logger = Logger();
  final TransactionRepository transactionRepository;

  TransactionBloc(this.transactionRepository) : super(TransactionInitial()) {

    on<GetAllTransactionEvent>((event, emit) async{
      emit(TransactionLoadingState());
      final result = await transactionRepository.getAllTransaction(event.userId);
      logger.i(result);
      if(result['success'] == true){
        emit(TransactionSuccessState());
      }
      else if(result['success'] == false){
        emit(TransactionErrorState(result['message']));
      }
    });


    // first event login
    on<MakeTransactionEvent>((event, emit) async {
      emit(TransactionLoadingState());
      final result = await transactionRepository.makeTransaction(event.dataRequest);
      logger.d(result);
      if(result != null && result['success'] == true){
        emit(TransactionSuccessState());
      }
      else  {
        emit(TransactionErrorState(result != null ? result['message'] : 'Unknown error'));
      }
    });

  }


}
