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
    on<CurrencyLoadEvent>((event, emit) async{
      emit(CurrencyLoadingState());
      try{
        final List<Currency> currencies = await currencyRepository.fetchCurrencies();
        logger.i(currencies);
        emit(CurrencyLoadedState(currencies: currencies));
      }catch (e){
        emit(CurrencyErrorState(message: e.toString()));
      }
    });

    on<DropdownItemSelectedCurrencyEvent>((event, emit) {
      // No need to fetch the user again if we already have the list and the selected user
      // Directly emit UserLoadedState with updated selectedUser
      if (state is CurrencyLoadedState) {
        logger.d(event.selectedCurrency);
        emit(CurrencyLoadedState(currencies: (state as CurrencyLoadedState).currencies, selectedCurrency: event.selectedCurrency));

      }
    });


  }
}
