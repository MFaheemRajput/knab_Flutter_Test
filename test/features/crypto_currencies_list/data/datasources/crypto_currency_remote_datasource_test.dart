import 'dart:convert';
import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/core/constants/constants.dart';
import 'package:my_app/features/crypto_currencies_list/data/datasources/crypto_currency_remote_datasource.dart';
import 'package:my_app/features/crypto_currencies_list/data/models/crypto_currency_model.dart';
import '../../../../fixtures/fixture_reader.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  CryptoCurrencyRemoteDataSourceImpl remoteDataSource;
  MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    remoteDataSource = CryptoCurrencyRemoteDataSourceImpl(client: mockHttpClient);
  });

  void setUpMockHttpClientSuccess200() {
    when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
      (_) async => http.Response(fixture('crypto_currencies.json'), 200),
    );
  }
  void setUpMockHttpClientFailure404() {
    when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
      (_) async => http.Response('Something went wrong', 404),
    );
  }

  group('getCryptoCurrencyList', 
  () {
    
    //final tCryptoCurrencyModel = CryptoCurrencyModel.fromJson(json.decode(fixture('crypto_currencies.json')));
    final tCryptoCurrencies = CryptoCurrencyModel.listFromJson(json.decode(fixture('crypto_currencies.json')));

    test('''should perform a GET request on a URL with number
   being the endpoint and with application/json header''', () {
      
      setUpMockHttpClientSuccess200();
      remoteDataSource.getRemoteData();
      var queryParameters = {
        //'convert': 'USD,EUR',
        'sort':'price'
      };
      var uri = Uri.parse(Constants.CAP_BASE_URL+Constants.CAP_CURRENCIES_URL);
      final newURI = uri.replace(queryParameters: queryParameters);

      verify(mockHttpClient.get(
        newURI,
        headers :{  
          'Content-Type': 'application/json',
          'X-CMC_PRO_API_KEY': Constants.CAP_API_KEY,
        },
      ));
    });

    test('should return crypto currencies when the response code 200',  
    () async {
    
          setUpMockHttpClientSuccess200();
          final result = await remoteDataSource.getRemoteData();
          expect(result, equals(tCryptoCurrencies));

    });
    
    test('should return ServerException when the response code other then 200',  
    () async {

          setUpMockHttpClientFailure404();
          final call = remoteDataSource.getRemoteData;
          expect(() => call(), throwsException); 

    });
  });

}
