import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/core/constants/constants.dart';
import 'package:my_app/features/crypto_currency_rates/data/models/foreign_currency_model.dart';

import '../../../../core/error/exceptions.dart';


abstract class ForeignCurrencyExchangeRemoteDataSource {
  /// Calls the https://api.exchangeratesapi.io/ endpoint.
  ///
  /// Throw a [ServerException] for all error
  Future<List<ForeignCurrencyModel>> getExchangeRate();
}

class ForeignCurrencyExchangeRemoteDataSourceImpl implements ForeignCurrencyExchangeRemoteDataSource {
  final http.Client client;
  ForeignCurrencyExchangeRemoteDataSourceImpl({@required this.client});
  @override
  Future <List<ForeignCurrencyModel>> getExchangeRate() => _getExchangeRateFromUrl();
  Future <List<ForeignCurrencyModel>> _getExchangeRateFromUrl() async {
    
    var queryParameters = {
      'base':'USD'
    };
    var uri = Uri.parse(Constants.RATE_API_BASE_URL+Constants.RATE_API_LATEST_USD);
    final newURI = uri.replace(queryParameters: queryParameters);
    print(newURI);
    final response = await client.get(
        newURI,
        headers :{  
          'Content-Type': 'application/json',
        },
    );
    if (response.statusCode == 200){
      return ForeignCurrencyModel.listFromJson(json.decode(response.body));
    } else{
      throw ServerException();
    }
  }
}
