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
  CurrencyLoadedState({required this.currencies});
  @override
  List<Object> get props => [currencies];
}

class CurrencyErrorState extends CurrencyState {
  final String message;
  CurrencyErrorState({required this.message});
  @override
  // TODO: implement props
  List<Object?> get props => [message];
}