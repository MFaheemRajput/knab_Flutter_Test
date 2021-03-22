
part of 'crypto_currency_cubit.dart';

abstract class CryptoCurrencyState extends Equatable {
  const CryptoCurrencyState();

  @override
  List<Object> get props => [];
}

class CryptoCurrencyInitial extends CryptoCurrencyState {}
class CryptoCurrencyLoading extends CryptoCurrencyState {
  const CryptoCurrencyLoading();
}
class CryptoCurrencyLoaded extends CryptoCurrencyState {
  final List<entity.CryptoCurrency> cryptoCurrencies;
  const CryptoCurrencyLoaded({this.cryptoCurrencies});

  @override 
  bool operator == (Object o){
    if(identical(this, o)) return true;
    return o is CryptoCurrencyLoaded && o.cryptoCurrencies == cryptoCurrencies;
  }

  @override int get hashCode => cryptoCurrencies.hashCode;

}
class CryptoCurrencyError extends CryptoCurrencyState {
  final String message ;
  const CryptoCurrencyError(this.message);
  
}

