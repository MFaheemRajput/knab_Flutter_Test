import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:my_app/core/database/database.dart';
import 'package:my_app/core/network/network_info.dart';
import 'package:my_app/features/crypto_currencies_list/data/repositories/crypto_currency_repository_impl.dart';
import 'package:my_app/features/crypto_currencies_list/domain/usecases/get_crypto_currencies.dart';
import 'package:my_app/features/crypto_currencies_list/presentation/cubit/crypto_currency_cubit.dart';
import 'package:my_app/features/crypto_currency_rates/data/datasources/foreign_currency_exchange_remote_datasource.dart';
import 'package:my_app/features/crypto_currency_rates/data/repositories/foreign_currency_exchange_repository_impl.dart';
import 'package:my_app/features/crypto_currency_rates/domain/repositories/foreign_currency_exchange_repository.dart';
import 'package:my_app/features/crypto_currency_rates/domain/usecases/get_foreign_currencies.dart';
import 'package:my_app/features/crypto_currency_rates/presentation/cubit/crypto_currency_detail_cubit.dart';
import 'features/crypto_currencies_list/data/datasources/crypto_currency_local_datasource.dart';
import 'features/crypto_currencies_list/data/datasources/crypto_currency_remote_datasource.dart';
import 'features/crypto_currencies_list/domain/repositories/crypto_currency_repository.dart';

final sl = GetIt.instance;
void init() async {

  //! Features - Crypto Currency
  // Cubit
  sl.registerFactory(() => CryptoCurrencyCubit(sl()));
  sl.registerFactory(() => CryptoCurrencyDetailCubit(sl()));

  // Use Cases
  sl.registerLazySingleton<GetCryptoCurrenciesUsecase>(() => GetCryptoCurrenciesUsecase(sl()));
  sl.registerLazySingleton<GetForeignCurrenciesUsecase>(() => GetForeignCurrenciesUsecase(sl()));

  // Repositories
  sl.registerLazySingleton<CryptoCurrencyRepository>(() => CryptoCurrencyRepositoryImpl(remoteDataSource: sl(), localDataSource: sl(), networkInfo: sl()));
  sl.registerLazySingleton<ForeignCurrencyExchangeRepository>(() => ForeignCurrencyExchangeRepositoryImpl(remoteDataSource: sl(), networkInfo: sl()));

  // data source
  sl.registerLazySingleton<CryptoCurrencyLocalDataSource>(() => CryptoCurrencyLocalDataSourceImpl());
  sl.registerLazySingleton<CryptoCurrencyRemoteDataSource>(() => CryptoCurrencyRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<ForeignCurrencyExchangeRemoteDataSource>(() => ForeignCurrencyExchangeRemoteDataSourceImpl(client: sl()));

  //data base
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! Core
  //sl.registerLazySingleton<AppDatabase>(() => AppDatabase());

  //! External
  sl.registerLazySingleton<Client>(() => Client());
  sl.registerLazySingleton<DataConnectionChecker>(() => DataConnectionChecker());
}
