
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class ForeignCurrency extends Equatable {

  final String symbol;
  final double unitPrice;
  DateTime lastUpdate;
  ForeignCurrency ( {
    @required this.symbol,
    @required this.unitPrice,
    @required this.lastUpdate,
    }) : super();

@override
  List<Object> get props => [symbol, unitPrice];
}     