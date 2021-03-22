import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/core/constants/constants.dart';

import '../../../../core/error/exceptions.dart';
import '../models/crypto_currency_model.dart';

abstract class CryptoCurrencyRemoteDataSource {
  /// Calls the https://pro-api.coinmarketcap.com/ endpoint.
  ///
  /// Throw a [ServerException] for all error
  Future<List<CryptoCurrencyModel>> getRemoteData();
}

class CryptoCurrencyRemoteDataSourceImpl implements CryptoCurrencyRemoteDataSource {
  final http.Client client;
  CryptoCurrencyRemoteDataSourceImpl({@required this.client});
  @override
  Future <List<CryptoCurrencyModel>> getRemoteData() => _getCrytpoCurrencyFromUrl();
  Future <List<CryptoCurrencyModel>> _getCrytpoCurrencyFromUrl() async {
    
    var queryParameters = {
      //'convert': 'USD,EUR',
      'sort':'price'
    };
    //var uri = Uri.parse(Constants.CAP_BASE_URL,Constants.CAP_CURRENCIES_URL , queryParameters);
    var uri = Uri.parse(Constants.CAP_BASE_URL+Constants.CAP_CURRENCIES_URL);
    final newURI = uri.replace(queryParameters: queryParameters);
    print(newURI);
    final response = await client.get(
        newURI,
        headers :{  
          'Content-Type': 'application/json',
          'X-CMC_PRO_API_KEY': Constants.CAP_API_KEY,
        },
    );
    if (response.statusCode == 200){
      return CryptoCurrencyModel.listFromJson(json.decode(response.body));
    } else{
      throw ServerException();
    }
  }
}
