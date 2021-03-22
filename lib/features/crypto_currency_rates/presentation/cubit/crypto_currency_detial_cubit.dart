import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'crypto_currency_detial_state.dart';

class CryptoCurrencyDetialCubit extends Cubit<CryptoCurrencyDetialState> {
  CryptoCurrencyDetialCubit() : super(CryptoCurrencyDetialInitial());
}
