import 'package:flutter/material.dart';
import 'package:my_app/features/crypto_currencies_list/domain/entities/crypto_currency.dart';
import 'package:meta/meta.dart';

class CryptoCurrencyModel extends CryptoCurrency {
  CryptoCurrencyModel({
    @required int id,
    @required String name,
    @required String symbol,
    @required double unitPrice,
    @required DateTime lastUpdate,
  }) : super(
          id: id,
          symbol: symbol,
          name: name,
          unitPrice: unitPrice,
          lastUpdate: lastUpdate
        );

  factory CryptoCurrencyModel.fromJson(Map<String, dynamic> json) {
    // TODO put some checks to verify data
    return CryptoCurrencyModel(
      id: (json['id'] as num).toInt(), 
      symbol: json['symbol'],
      name: json['name'],
      unitPrice: (json['quote']['USD']['price'] as num).toDouble(),
      lastUpdate: DateTime.tryParse(json['quote']['USD']['last_updated'])
    );
  }

  static List<CryptoCurrency> listFromJson(Map<String, dynamic> json){
    List<CryptoCurrencyModel> list =  [];
    final jsonList = json['data'];
    for(var cryptoCurrencyJson in jsonList){
      var cryptoCurrency = CryptoCurrencyModel.fromJson(cryptoCurrencyJson);
      // we can make this check more good
      if(!list.contains(cryptoCurrency)){
        list.add(cryptoCurrency);
      }
    }
    return list;
  }

  Map<String, dynamic> toJson(){

    return {
      'id':id,
      'symbol':symbol,
      'name':name,
    }; 
  }
}
