import 'package:dartz/dartz.dart';
import 'package:my_app/features/crypto_currencies_list/domain/entities/crypto_currency.dart';
import '../error/failures.dart';

abstract class UseCase <Type, Params> {

  Future<Either<Failure, Type>> call(Params params);
  
}

class NoParams {

}