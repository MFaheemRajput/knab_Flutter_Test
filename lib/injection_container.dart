import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:my_app/core/database/database.dart';
import 'package:my_app/core/network/network_info.dart';
import 'package:my_app/features/crypto_currencies_list/data/repositories/crypto_currency_repository_impl.dart';
import 'package:my_app/features/crypto_currencies_list/domain/usecases/get_crypto_currencies.dart';
import 'package:my_app/features/crypto_currencies_list/presentation/cubit/crypto_currency_cubit.dart';
import 'features/crypto_currencies_list/data/datasources/crypto_currency_local_datasource.dart';
import 'features/crypto_currencies_list/data/datasources/crypto_currency_remote_datasource.dart';
import 'features/crypto_currencies_list/domain/repositories/crypto_currency_repository.dart';

final sl = GetIt.instance;
void init() async {

  //! Features - Crypto Currency
  // Cubit
  sl.registerFactory(() => CryptoCurrencyCubit(sl()));

  // Use Cases
  sl.registerLazySingleton<GetCryptoCurrenciesUsecase>(() => GetCryptoCurrenciesUsecase(sl()));

  // Repositories
  sl.registerLazySingleton<CryptoCurrencyRepository>(() => CryptoCurrencyRepositoryImpl(remoteDataSource: sl(), localDataSource: sl(), networkInfo: sl()));

  // data source
  sl.registerLazySingleton<CryptoCurrencyLocalDataSource>(() => CryptoCurrencyLocalDataSourceImpl(database: sl()));
  sl.registerLazySingleton<CryptoCurrencyRemoteDataSource>(() => CryptoCurrencyRemoteDataSourceImpl(client: sl()));

  //data base
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! Core
  sl.registerLazySingleton<AppDatabase>(() => AppDatabase());

  //! External
  sl.registerLazySingleton<Client>(() => Client());
  sl.registerLazySingleton<DataConnectionChecker>(() => DataConnectionChecker());
}
