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
