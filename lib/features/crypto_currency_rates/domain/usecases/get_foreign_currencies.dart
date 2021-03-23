
import 'package:dartz/dartz.dart';
import 'package:my_app/core/error/failures.dart';
import 'package:my_app/core/usecases/usecase.dart';
import 'package:my_app/features/crypto_currency_rates/domain/entities/foreign_currency.dart';
import 'package:my_app/features/crypto_currency_rates/domain/repositories/foreign_currency_exchange_repository.dart';

class GetForeignCurrenciesUsecase implements UseCase <List<ForeignCurrency>, NoParams> {
  final ForeignCurrencyExchangeRepository repository;
  GetForeignCurrenciesUsecase(this.repository);
  @override 
  Future<Either<Failure, List<ForeignCurrency>>> call(NoParams params) async {
    return repository.getForeignCurrencies();
  }
}
