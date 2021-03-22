import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CryptoCurrencyDetailView extends StatefulWidget {
  CryptoCurrencyDetailView({Key key}) : super(key: key);

  @override
  _CryptoCurrencyDetailViewState createState() => _CryptoCurrencyDetailViewState();
}

class _CryptoCurrencyDetailViewState extends State<CryptoCurrencyDetailView> {
  @override
  void initState() {
    super.initState();
    //BlocProvider.of<CryptoCurrencyCubit>(context)..getCryptoCurrencyList();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       title: const Text('Crypto Currency Detail'),
     ),
     body: Container(

     ),
    );
  }
}