import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:my_app/features/crypto_currency_rates/domain/entities/foreign_currency.dart';

class ForeignCurrencyModel extends ForeignCurrency {
  ForeignCurrencyModel({
    @required String symbol,
    @required double unitPrice,
    DateTime lastUpdate,
  }) : super(
          symbol: symbol,
          unitPrice: unitPrice,
          lastUpdate: lastUpdate
        );

  factory ForeignCurrencyModel.fromJson(MapEntry<String, dynamic> json) {
    // TODO put some checks to verify data
    return ForeignCurrencyModel(
      symbol: json.key,
      unitPrice: json.value,
    );
  }

  static List<ForeignCurrency> listFromJson(Map<String, dynamic> json){
    List<ForeignCurrencyModel> list =  [];
    final Map<String, dynamic> jsonList = json['rates'];
    for(var foreignCurrencyJson in jsonList.entries){
      
      var foreignCurrency = ForeignCurrencyModel.fromJson(foreignCurrencyJson);
      foreignCurrency.lastUpdate = DateTime.tryParse(json['date']);
      // we can make this check more good
      if(!list.contains(foreignCurrency)){
        list.add(foreignCurrency);
      }
    }
    return list;
  }
}
