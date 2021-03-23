import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/features/crypto_currencies_list/presentation/cubit/crypto_currency_cubit.dart';
import 'package:my_app/features/crypto_currencies_list/presentation/pages/crypto_currencies_ui.dart';
import 'package:my_app/features/crypto_currency_rates/presentation/cubit/crypto_currency_detail_cubit.dart';
import 'package:my_app/injection_container.dart';


void main() async {
  
  await init();
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);
  @override
  _myAppState createState() => _myAppState();
}

class _myAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    title: 'Material App',
    home: MultiBlocProvider(
    providers: [
      BlocProvider<CryptoCurrencyCubit>(
        create: (BuildContext context) => CryptoCurrencyCubit(sl()),
      ),
      BlocProvider<CryptoCurrencyDetailCubit>(
        create: (BuildContext context) => CryptoCurrencyDetailCubit(sl()),
      ),
    ],
      child: CryptoCurrenciesListView(),
    ));
  }
}