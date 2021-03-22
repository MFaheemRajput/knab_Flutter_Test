
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class CryptoCurrency extends Equatable {

  final int id;
  final String name;
  final String symbol;
  final double unitPrice;
  final DateTime lastUpdate;
  CryptoCurrency ( {
    @required this.id, 
    @required this.name,
    @required this.symbol,
    @required this.unitPrice,
    @required this.lastUpdate,
    }) : super();

@override
  List<Object> get props => [id, name, symbol, unitPrice];
}     