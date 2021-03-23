import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/core/widgets/error_widget.dart';
import 'package:my_app/core/widgets/initial_widget.dart';
import 'package:my_app/core/widgets/loading_widget.dart';
import 'package:my_app/features/crypto_currencies_list/presentation/cubit/crypto_currency_cubit.dart';
import 'package:my_app/features/crypto_currencies_list/presentation/widgets/crypto_currency_list_view_widget.dart';
import 'package:my_app/injection_container.dart';

class CryptoCurrenciesListView extends StatefulWidget {
  CryptoCurrenciesListView({Key key}) : super(key: key);

  @override
  _CryptoCurrenciesListViewState createState() => _CryptoCurrenciesListViewState();
}

class _CryptoCurrenciesListViewState extends State<CryptoCurrenciesListView> {

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CryptoCurrencyCubit>(context)..getCryptoCurrencyList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Crypto Currency'),
        ),
        body: Container(
         child: BlocBuilder<CryptoCurrencyCubit, CryptoCurrencyState>(
           builder: (context, state){
              if (state is CryptoCurrencyInitial){
                return InitialWidget();
              } else if(state is CryptoCurrencyLoading){
                return LoadingWidget();
              } else if (state is CryptoCurrencyLoaded){
                return CryptoCurrencyListView(items: state.cryptoCurrencies);
              } else {
                return MyErrorWidget();
              }
            },
            
       ),
    ),);
  }
}