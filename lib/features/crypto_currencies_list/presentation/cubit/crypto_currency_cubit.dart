import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_app/core/usecases/usecase.dart';
import 'package:my_app/features/crypto_currencies_list/domain/entities/crypto_currency.dart' as entity;
import 'package:my_app/features/crypto_currencies_list/domain/usecases/get_crypto_currencies.dart';

part 'crypto_currency_state.dart';

class CryptoCurrencyCubit extends Cubit<CryptoCurrencyState> {

  final GetCryptoCurrenciesUsecase getCryptoCurrencies;
  
  CryptoCurrencyCubit(this.getCryptoCurrencies) : super(CryptoCurrencyInitial());

   Future<void> getCryptoCurrencyList() async {
    try {
      emit(CryptoCurrencyInitial());  
      emit(CryptoCurrencyLoading());
      final cryptoCurrencies = await getCryptoCurrencies(NoParams());
      cryptoCurrencies.fold (
        (failure) => emit(CryptoCurrencyError('Opss Somthing Went Wrong')), 
        (success) => emit(CryptoCurrencyLoaded(cryptoCurrencies: success)),
      );
    } catch (Exception){
      emit(CryptoCurrencyError('Opss Somthing Went Wrong'));
    }

    }

}
