import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:my_app/core/database/database.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/error/exceptions.dart';
import '../models/crypto_currency_model.dart';

abstract class CryptoCurrencyLocalDataSource {
  /// Get cached [CryptoCurrencyModel] which was gotten the last time
  /// the user had internet connection.
  ///
  /// Throw a [CacheException] if no cached data is present.
  Future<List<CryptoCurrencyModel>> getCachedData();

  /// Calls the API endpoint.
  ///
  /// Throw a [CacheException] for all error
  Future<void> cacheCryptoCurrency(List<CryptoCurrencyModel> cryptoCurrenciesToCache);
}

class CryptoCurrencyLocalDataSourceImpl implements CryptoCurrencyLocalDataSource {
  // here can be any class for local DB local File data etc
  // also it is best if create a connection file speratelity.
  // so incase if in future we need to switch the method and technology of local storage to other kind of storage.
  // we can do that without change in datasource layer.
  final AppDatabase database;
  // todo replace it with local DB
  CryptoCurrencyLocalDataSourceImpl({@required this.database});
  
  @override
  Future<List<CryptoCurrencyModel>> getCachedData() {

    // final jsonString = database.s
    // if (jsonString != null) {
    //   return Future.value(CryptoCurrencyModel.fromJson(json.decode(jsonString)));
    // } else {
    //   throw CacheException();
    // }

  }

  @override
  Future <void> cacheCryptoCurrency(List<CryptoCurrencyModel> cryptoCurrenciesToCache) {

    // return sharedPreferences.setString(
    //     CACHED_NUMBER_TRIVIA,
    //     json.encode(
    //       cryptoCurrenciesToCache.toJson(),
    //     ));
  
  
  }

 
}
