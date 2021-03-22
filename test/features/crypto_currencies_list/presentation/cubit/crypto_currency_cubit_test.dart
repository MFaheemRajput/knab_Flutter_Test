import 'dart:convert';

import 'package:my_app/core/error/failures.dart';
import 'package:my_app/core/usecases/usecase.dart';
import 'package:my_app/features/crypto_currencies_list/data/models/crypto_currency_model.dart';
import 'package:my_app/features/crypto_currencies_list/domain/entities/crypto_currency.dart';
import 'package:dartz/dartz.dart';
import 'package:my_app/features/crypto_currencies_list/domain/usecases/get_crypto_currencies.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:my_app/features/crypto_currencies_list/presentation/cubit/crypto_currency_cubit.dart';

import '../../../../fixtures/fixture_reader.dart';

class MockGetCryptoCurrenciesUsecase extends Mock implements GetCryptoCurrenciesUsecase{}

void main() {
  CryptoCurrencyCubit cubit;
  MockGetCryptoCurrenciesUsecase mockGetCryptoCurrenciesUsecase;
  
  setUp((){
    mockGetCryptoCurrenciesUsecase = MockGetCryptoCurrenciesUsecase();
    cubit = CryptoCurrencyCubit(mockGetCryptoCurrenciesUsecase);
  });

  test('initialState should be Empty', 
    () {
        expect(cubit.state, equals(CryptoCurrencyInitial()));
    });

  group('GetCryptoCurrencies',
    (){
      
      final tCryptoCurrencyModels = CryptoCurrencyModel.listFromJson(json.decode(fixture('crypto_currencies.json')));
      final List<CryptoCurrency> tCryptoCurrencies = tCryptoCurrencyModels;

    test('should get data from usecase',
     ()
     async {

        when(mockGetCryptoCurrenciesUsecase(any)).thenAnswer((_) async => Right(tCryptoCurrencies));

        cubit.getCryptoCurrencies(NoParams());

        await untilCalled(mockGetCryptoCurrenciesUsecase(any));

        verify(mockGetCryptoCurrenciesUsecase(any));
       // verifyNever(mockGetCryptoCurrenciesUsecase(any));
      });
  });

}