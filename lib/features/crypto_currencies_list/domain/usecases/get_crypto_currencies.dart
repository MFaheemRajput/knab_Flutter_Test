
import 'package:dartz/dartz.dart';
import 'package:my_app/core/error/failures.dart';
import 'package:my_app/core/usecases/usecase.dart';
import 'package:my_app/features/crypto_currencies_list/domain/entities/crypto_currency.dart';
import 'package:my_app/features/crypto_currencies_list/domain/repositories/crypto_currency_repository.dart';

class GetCryptoCurrenciesUsecase implements UseCase <List<CryptoCurrency>, NoParams> {
  final CryptoCurrencyRepository repository;
  GetCryptoCurrenciesUsecase(this.repository);
  @override 
  Future<Either<Failure, List<CryptoCurrency>>> call(NoParams params) async {
    return repository.getCryptoCurrencies();
  }
}
