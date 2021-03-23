

import 'package:dartz/dartz.dart';
import 'package:my_app/core/error/failures.dart';
import 'package:my_app/features/crypto_currency_rates/domain/entities/foreign_currency.dart';

abstract class ForeignCurrencyExchangeRepository {

  Future<Either<Failure, List<ForeignCurrency>>> getForeignCurrencies();

}  