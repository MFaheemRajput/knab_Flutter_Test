part of 'crypto_currency_detail_cubit.dart';

abstract class CryptoCurrencyDetailState extends Equatable {
  const CryptoCurrencyDetailState();

  @override
  List<Object> get props => [];
}


class CryptoCurrencyDetailInitial extends CryptoCurrencyDetailState {}

class CryptoCurrencyDetailLoading extends CryptoCurrencyDetailState {
  const CryptoCurrencyDetailLoading();
}
class CryptoCurrencyDetailLoaded extends CryptoCurrencyDetailState {
  final List<ForeignCurrency> currencies;
  const CryptoCurrencyDetailLoaded({this.currencies});

  @override 
  bool operator == (Object o){
    if(identical(this, o)) return true;
    return o is CryptoCurrencyDetailLoaded && o.currencies == currencies;
  }

  @override int get hashCode => currencies.hashCode;

}
class CryptoCurrencyDetailError extends CryptoCurrencyDetailState {
  final String message ;
  const CryptoCurrencyDetailError(this.message);
  
}