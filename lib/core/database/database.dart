import 'package:moor/moor.dart';
import 'package:moor/ffi.dart';
import 'package:my_app/features/crypto_currencies_list/domain/entities/crypto_currency.dart' as Entity;
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'dart:io';

// assuming that your file is called filename.dart. This will give an error at first,
// but it's needed for moor to know about the generated code
part 'database.g.dart';

// this will generate a table called "CryptoCurrencies" for us. The rows of that table will
// be represented by a class called "CryptoCurrency".
@DataClassName("CryptoCurrency")
class CryptoCurrencies extends Table {
  IntColumn get id => integer()();
  IntColumn get numMarketPairs => integer()();
  IntColumn get maxSupply => integer()();
  IntColumn get circulatingSupply => integer()();
  IntColumn get totalSupply => integer()();
  TextColumn get name => text().withLength(min: 2, max: 32)();
  TextColumn get symbol => text().withLength(min: 2, max: 8)();
  TextColumn get slug => text().withLength(min: 2, max: 32)();
  DateTimeColumn get dateAdded => dateTime()();
  DateTimeColumn get lastUpdated => dateTime()();

}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'KnabDB.sqlite'));
    return VmDatabase(file);
  });
}

// this annotation tells moor to prepare a database class that uses both of the
// tables we just defined. We'll see how to use that database class in a moment.
@UseMoor(tables: [CryptoCurrencies])
class AppDatabase extends _$AppDatabase {
  // we tell the database where to store the data with this constructor
  AppDatabase() : super(_openConnection());

  // you should bump this number whenever you change or add a table definition. Migrations
  // are covered later in this readme.
  @override
  int get schemaVersion => 1;

  // Stream<List<Entity.CryptoCurrency>> watchAllCryptocurrencies() {
  //   //return (select(cryptocurrencies).watch());
  // }

  // Future<bool> insertCryptoCurrencies(List<Entity.CryptoCurrency>){
  //   return Future.value(true);
  // }
  
}
