import 'package:flutter/material.dart';
import 'package:my_app/features/crypto_currencies_list/domain/entities/crypto_currency.dart';
import 'package:my_app/features/crypto_currency_rates/presentation/pages/crypto_currency_detail_ui.dart';

class CryptoCurrencyListView extends StatefulWidget {

  final List<CryptoCurrency> items;
  CryptoCurrencyListView({Key key,@required this.items}) : super(key: key);
  
  @override
  _CryptoCurrencyListViewState createState() => _CryptoCurrencyListViewState();

}

class _CryptoCurrencyListViewState extends State<CryptoCurrencyListView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0),
       child: ListView(
         children: List.generate(this.widget.items.length, (index) => 
         GestureDetector(
            child: ListTile(
             title: Text(this.widget.items[index].name +' ('+this.widget.items[index].symbol+')'),
             subtitle: Text('1 = '+this.widget.items[index].unitPrice.toString()+'\n Last update '+ this.widget.items[index].lastUpdate.toLocal().toString()),
             trailing: Icon(Icons.arrow_forward),
           ),
           onTap: () {
             Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => CryptoCurrencyDetailView()),
  );
           },
         )),
       ),
    );
  }
}