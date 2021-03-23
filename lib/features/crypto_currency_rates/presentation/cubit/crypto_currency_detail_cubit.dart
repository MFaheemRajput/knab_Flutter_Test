import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_app/core/usecases/usecase.dart';
import 'package:my_app/features/crypto_currency_rates/domain/entities/foreign_currency.dart';
import 'package:my_app/features/crypto_currency_rates/domain/usecases/get_foreign_currencies.dart';

part 'crypto_currency_detail_state.dart';

class CryptoCurrencyDetailCubit extends Cubit<CryptoCurrencyDetailState> {

  final GetForeignCurrenciesUsecase getForeignCurrencies;
  CryptoCurrencyDetailCubit(this.getForeignCurrencies) : super(CryptoCurrencyDetailInitial());

  Future<void> getForeignCurrencyList() async {
    try {
      emit(CryptoCurrencyDetailInitial());  
      emit(CryptoCurrencyDetailLoading());
      final cryptoCurrencies = await getForeignCurrencies(NoParams());
      cryptoCurrencies.fold (
        (failure) => emit(CryptoCurrencyDetailError('Opss Somthing Went Wrong')), 
        (success) => emit(CryptoCurrencyDetailLoaded(currencies: success)),
      );
    } catch (Exception){
      emit(CryptoCurrencyDetailError('Opss Somthing Went Wrong'));
    }

    }

}
