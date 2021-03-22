

import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:my_app/core/usecases/usecase.dart';
import 'package:my_app/features/crypto_currencies_list/data/models/crypto_currency_model.dart';
import 'package:my_app/features/crypto_currencies_list/domain/entities/crypto_currency.dart';
import 'package:my_app/features/crypto_currencies_list/domain/repositories/crypto_currency_repository.dart';
import 'package:my_app/features/crypto_currencies_list/domain/usecases/get_crypto_currencies.dart';

import '../../../../fixtures/fixture_reader.dart';

class MockCryptoCurrencyRepository extends Mock implements CryptoCurrencyRepository {


}

void main(){
  GetCryptoCurrenciesUsecase usecase;
  MockCryptoCurrencyRepository mockCryptoCurrencyRepository;
  final tCryptoCurrencyModels = CryptoCurrencyModel.listFromJson(json.decode(fixture('crypto_currencies.json')));
  final List<CryptoCurrency>tCryptoCurrencies = tCryptoCurrencyModels;
  setUp((){
    mockCryptoCurrencyRepository = MockCryptoCurrencyRepository();
    usecase = GetCryptoCurrenciesUsecase(mockCryptoCurrencyRepository);
  }); 

  test(
    'Should get crypto currencies list from the repository',
    () async {
      when(mockCryptoCurrencyRepository.getCryptoCurrencies())
      .thenAnswer((_) async => Right(tCryptoCurrencies));

      final result = await usecase(NoParams());

      expect (result, Right(tCryptoCurrencies));

      verify(mockCryptoCurrencyRepository.getCryptoCurrencies());

      verifyNoMoreInteractions(mockCryptoCurrencyRepository); 
 
    },
  );
}