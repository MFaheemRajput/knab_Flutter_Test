import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_app/features/crypto_currencies_list/data/models/crypto_currency_model.dart';
import 'package:my_app/features/crypto_currencies_list/domain/entities/crypto_currency.dart';

import '../../../../fixtures/fixture_reader.dart';

void main(){
  final tCryptoCurrencyModel = CryptoCurrencyModel.fromJson(json.decode(fixture('crypto_currency.json')));
test(
  'should be a subclass of Crypto Currency entity',
  () async {
    //arrange 

    // act

    // assert
    expect(tCryptoCurrencyModel, isA<CryptoCurrency>());

    }
  );
}