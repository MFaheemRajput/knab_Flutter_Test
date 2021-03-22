import 'package:flutter/material.dart';
import 'package:my_app/core/error/exceptions.dart';
import 'package:my_app/core/network/network_info.dart';
import 'package:my_app/features/crypto_currencies_list/data/datasources/crypto_currency_local_datasource.dart';
import 'package:my_app/features/crypto_currencies_list/data/datasources/crypto_currency_remote_datasource.dart';
import 'package:my_app/features/crypto_currencies_list/domain/entities/crypto_currency.dart';
import 'package:my_app/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:my_app/features/crypto_currencies_list/domain/repositories/crypto_currency_repository.dart';

class CryptoCurrencyRepositoryImpl implements CryptoCurrencyRepository {
  final CryptoCurrencyLocalDataSource localDataSource;
  final CryptoCurrencyRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  CryptoCurrencyRepositoryImpl(
      {@required this.remoteDataSource,
      @required this.localDataSource,
      @required this.networkInfo});

  @override
  Future<Either<Failure, List<CryptoCurrency>>> getCryptoCurrencies() async {    
      try {
          final localData = await localDataSource.getCachedData();
          if(localData == null || (localData != null && localData.isEmpty)){
          // get data from server
            if(await networkInfo.isConnected){
              try {
                final remoteData = await remoteDataSource.getRemoteData();
                localDataSource.cacheCryptoCurrency(remoteData);
                return Right(remoteData);
              } on ServerException {
                return Left(ServerFailure());
              }
            } else {
              return Left(NetworkFailure());
            }
          }
          return Right(localData);
        } on CacheException{
          return Left(CacheFailure());
        } 
  }  
}
