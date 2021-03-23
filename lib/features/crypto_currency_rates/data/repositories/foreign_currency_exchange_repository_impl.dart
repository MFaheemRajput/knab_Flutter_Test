import 'package:flutter/material.dart';
import 'package:my_app/core/error/exceptions.dart';
import 'package:my_app/core/network/network_info.dart';
import 'package:my_app/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:my_app/features/crypto_currency_rates/data/datasources/foreign_currency_exchange_remote_datasource.dart';
import 'package:my_app/features/crypto_currency_rates/domain/entities/foreign_currency.dart';
import 'package:my_app/features/crypto_currency_rates/domain/repositories/foreign_currency_exchange_repository.dart';

class ForeignCurrencyExchangeRepositoryImpl implements ForeignCurrencyExchangeRepository {

  final ForeignCurrencyExchangeRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  ForeignCurrencyExchangeRepositoryImpl(
      {@required this.remoteDataSource,
      @required this.networkInfo});

  @override
  Future<Either<Failure, List<ForeignCurrency>>> getForeignCurrencies() async {    
      try {
            // get data from server
            if(await networkInfo.isConnected){
              final remoteData = await remoteDataSource.getExchangeRate();               
              return Right(remoteData);
            } else {
              return Left(NetworkFailure());
            }
        } on ServerException{
          return Left(ServerFailure());
        } 
  }  
}
