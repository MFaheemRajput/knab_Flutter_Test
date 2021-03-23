import 'package:flutter/material.dart';
import 'package:my_app/features/crypto_currency_rates/domain/entities/foreign_currency.dart';
import 'package:my_app/features/crypto_currency_rates/presentation/pages/crypto_currency_detail_ui.dart';

class CurrencyListView extends StatelessWidget {
  const CurrencyListView({
    Key key,
    @required this.widget,
    @required this.items,
  }) : super(key: key);

  final CryptoCurrencyDetailView widget;
  final List<ForeignCurrency> items;

  @override
  Widget build(BuildContext context) {
    

    return ListView(
         children: List.generate(items.length, (index) => 
            
             ListTile(
              title: Text(items[index].symbol),
              subtitle: Text('1 x '+(this.widget.selectedCryptoCurrency.unitPrice * items[index].unitPrice).toString()),
            ),
          ),
        );
  }
}