import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:transfer_flutter/repository/currency_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';

import '../models/Currency.dart';

part 'currency_event.dart';
part 'currency_state.dart';

class CurrencyBloc extends Bloc<CurrencyEvent, CurrencyState> {
  var logger = Logger();
  final CurrencyRepository currencyRepository;
  CurrencyBloc(this.currencyRepository) : super(CurrencyInitial()) {
    on<CurrencyEvent>((event, emit) async{
      emit(CurrencyLoadingState());
      try{
        final List<Currency> currencies = await currencyRepository.fetchCurrencies();
        logger.i(currencies);
        emit(CurrencyLoadedState(currencies: currencies));
      }catch (e){
        emit(CurrencyErrorState(message: e.toString()));
      }
    });
  }
}
