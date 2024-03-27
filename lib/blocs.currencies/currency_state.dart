part of 'currency_bloc.dart';

@immutable
abstract class CurrencyState  extends Equatable{}

class CurrencyInitial extends CurrencyState {
  @override
  List<Object> get props => [];
}

class CurrencyLoadingState extends CurrencyState {
  @override
  List<Object> get props => [];
}

class CurrencyLoadedState extends CurrencyState {
  List<Currency> currencies;
  final Currency? selectedCurrency;
  CurrencyLoadedState({required this.currencies, this.selectedCurrency});
  @override
  List<Object?> get props => [currencies, selectedCurrency];
}

class CurrencyErrorState extends CurrencyState {
  final String message;
  CurrencyErrorState({required this.message});
  @override
  // TODO: implement props
  List<Object?> get props => [message];
}

class DropdownItemSelectedCurrencyState extends CurrencyState {
  final Currency selectedCurrency;
  DropdownItemSelectedCurrencyState({required this.selectedCurrency});
  @override
  // TODO: implement props
  List<Object?> get props => [selectedCurrency];
}