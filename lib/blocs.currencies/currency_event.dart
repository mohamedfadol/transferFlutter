part of 'currency_bloc.dart';

@immutable
abstract class CurrencyEvent extends Equatable{
  const CurrencyEvent();
}

class CurrencyLoadEvent extends CurrencyEvent {
  @override
  List<Object> get props => [];
}

class CurrencyLoadedEvent extends CurrencyEvent {
  final CurrencyListData currencies;
  const CurrencyLoadedEvent({required this.currencies});
  @override
  List<Object> get props => [currencies];
}


class DropdownItemSelectedCurrencyEvent extends CurrencyEvent {
  final Currency selectedCurrency;
  const DropdownItemSelectedCurrencyEvent({required this.selectedCurrency});
  @override
  // TODO: implement props
  List<Object?> get props => [selectedCurrency];
}