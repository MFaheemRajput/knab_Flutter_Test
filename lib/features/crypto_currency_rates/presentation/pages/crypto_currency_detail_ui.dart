import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/core/widgets/error_widget.dart';
import 'package:my_app/core/widgets/initial_widget.dart';
import 'package:my_app/core/widgets/loading_widget.dart';
import 'package:my_app/features/crypto_currencies_list/domain/entities/crypto_currency.dart';
import 'package:my_app/features/crypto_currency_rates/presentation/cubit/crypto_currency_detail_cubit.dart';
import 'package:my_app/features/crypto_currency_rates/presentation/widgets/currency_list_view.dart';


class CryptoCurrencyDetailView extends StatefulWidget {
  @required
  final CryptoCurrency selectedCryptoCurrency;
  CryptoCurrencyDetailView({this.selectedCryptoCurrency, Key key})
      : super(key: key);

  @override
  _CryptoCurrencyDetailViewState createState() =>
      _CryptoCurrencyDetailViewState();
}

class _CryptoCurrencyDetailViewState extends State<CryptoCurrencyDetailView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CryptoCurrencyDetailCubit>(context)..getForeignCurrencyList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text( this.widget.selectedCryptoCurrency.name)),
      body: BlocBuilder<CryptoCurrencyDetailCubit, CryptoCurrencyDetailState>(
          builder: (context, state) {
            if (state is CryptoCurrencyDetailInitial){
                return InitialWidget();
              } else if(state is CryptoCurrencyDetailLoading){
                return LoadingWidget();
              } else if (state is CryptoCurrencyDetailLoaded){
                return CurrencyListView(widget: this.widget, items:state.currencies);
              } else {
                return MyErrorWidget();
              }
          },
        ), 
    );
  }

  // custom() {
  //   return CustomScrollView(
  //     slivers: <Widget>[
  //       SliverAppBar(
  //         expandedHeight: MediaQuery.of(context).size.height * .25,
  //         floating: false,
  //         pinned: true,
  //         flexibleSpace: FlexibleSpaceBar(
  //           centerTitle: true,
  //           title: Text(
  //             this.widget.selectedCryptoCurrency.name,
  //             style: TextStyle(
  //               color: Colors.white,
  //               fontSize: 16.0,
  //             ),
  //           ),
  //         ),
  //       ),
  //       CurrencyListView(widget: this.widget)
  //     ],
  //   );
  // }
}
