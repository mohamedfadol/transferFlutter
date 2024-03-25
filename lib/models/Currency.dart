

class CurrencyListData{
  List<Currency>? currencies;

  CurrencyListData.fromJson(Map<String, dynamic> json) {
    if (json['currencies'] != null) {
      currencies = <Currency>[];
      json['currencies'].forEach((v) {
        currencies!.add(Currency.fromJson(v));
      });
    }
  }
}

class Currency{
  final int? currencyId;
  final String? currencyName;
  final String? currencyRate;

  Currency({this.currencyId, this.currencyName, this.currencyRate});

  // create new converter
  factory Currency.fromJson(Map<String, dynamic> json) =>
      Currency(
        currencyId: json['id'],
        currencyName: json['currency_name'],
        currencyRate: json['currency_rate'],
      );
}