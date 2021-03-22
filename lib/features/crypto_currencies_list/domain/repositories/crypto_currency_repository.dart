

import 'package:dartz/dartz.dart';
import 'package:my_app/core/error/failures.dart';
import 'package:my_app/features/crypto_currencies_list/domain/entities/crypto_currency.dart';

abstract class CryptoCurrencyRepository {

  Future<Either<Failure, List<CryptoCurrency>>> getCryptoCurrencies();

}  