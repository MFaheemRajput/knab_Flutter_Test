import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:my_app/core/error/exceptions.dart';
import 'package:my_app/core/error/failures.dart';
import 'package:my_app/core/network/network_info.dart';
import 'package:my_app/features/crypto_currencies_list/data/datasources/crypto_currency_remote_datasource.dart';
import 'package:my_app/features/crypto_currencies_list/data/datasources/crypto_currency_local_datasource.dart';
import 'package:my_app/features/crypto_currencies_list/data/models/crypto_currency_model.dart';
import 'package:my_app/features/crypto_currencies_list/data/repositories/crypto_currency_repository_impl.dart';
import 'package:my_app/features/crypto_currencies_list/domain/entities/crypto_currency.dart';

import '../../../../fixtures/fixture_reader.dart';

class MockRemoteDataSource extends Mock implements CryptoCurrencyRemoteDataSource {


}

class MockLocalDataSource extends Mock implements CryptoCurrencyLocalDataSource {


}

class MockNetworkInfo extends Mock implements NetworkInfo{

}

void main() {

  CryptoCurrencyRepositoryImpl repository;
  MockRemoteDataSource mockRemoteDataSource;
  MockLocalDataSource mockLocalDataSource;
  MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    mockLocalDataSource = MockLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = CryptoCurrencyRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo
    );
  });

  void runTestOnline(Function body) {
    group('Device is online', () {
      setUp((){
          when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });
    body();
    });
  }

  void runTestOffline(Function body) {
    group('Device is offline', () {
      setUp((){
          when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });
    body();
    });
  }

  group('Is Device Online', (){
    
    test(
      'Should check if the device is online',
       () async {
          //arange 
          when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);

          //act
          repository.getCryptoCurrencies();

          //assert
          verifyNever(mockNetworkInfo.isConnected);

    },
    );
  });

  runTestOnline( () {

    final tCryptoCurrencyModels = CryptoCurrencyModel.listFromJson(json.decode(fixture('crypto_currencies.json')));
    final List<CryptoCurrency> tCryptoCurrencies = tCryptoCurrencyModels;

    test(
      'Should return remote data when the call to remote data source is successful',
       () async {

          //arange 
          when(mockRemoteDataSource.getRemoteData()).thenAnswer((_) async => tCryptoCurrencyModels);

          //act
          final result = await repository.getCryptoCurrencies();

          //assert
          verify(mockRemoteDataSource.getRemoteData());
          expect(result, equals(Right(tCryptoCurrencies)));
    },
    );

    test(
      'Should cache the data locally when the call to remote data source is successful',
       () async {

          //arange 
          when(mockRemoteDataSource.getRemoteData()).thenAnswer((_) async => tCryptoCurrencyModels);

          //act
          await repository.getCryptoCurrencies();

          //assert
          verify(mockRemoteDataSource.getRemoteData());
          verify(mockLocalDataSource.cacheCryptoCurrency(tCryptoCurrencyModels));
    },
    );
  });

  runTestOffline(() {

    final tCryptoCurrencyModels = CryptoCurrencyModel.listFromJson(json.decode(fixture('crypto_currencies.json')));
    final List<CryptoCurrency> tCryptoCurrencies = tCryptoCurrencyModels;


    test(
      'Should return last localy cached data when the cached data is availabale',
      () async {
          //arange 
          when(mockLocalDataSource.getCachedData()).thenAnswer((_) async => tCryptoCurrencyModels);

          //act
          final result = await repository.getCryptoCurrencies();

          //assert
          verifyZeroInteractions(mockRemoteDataSource);
          verify(mockLocalDataSource.getCachedData());
          expect(result, equals(Right(tCryptoCurrencies)));
    },
    );

    test(
      'Should return CacheFailure when the cached data is not availabale',
      () async {
          //arange 
          when(mockLocalDataSource.getCachedData()).thenThrow(CacheException());

          //act
          final result = await repository.getCryptoCurrencies();

          //assert
          verifyZeroInteractions(mockRemoteDataSource);
          verify(mockLocalDataSource.getCachedData());
          expect(result, equals(Left(CacheFailure())));
    },
    );

  });

} 