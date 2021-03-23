// // GENERATED CODE - DO NOT MODIFY BY HAND

// part of 'database.dart';

// // **************************************************************************
// // MoorGenerator
// // **************************************************************************

// // ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
// class CryptoCurrency extends DataClass implements Insertable<CryptoCurrency> {
//   final int id;
//   final int numMarketPairs;
//   final int maxSupply;
//   final int circulatingSupply;
//   final int totalSupply;
//   final String name;
//   final String symbol;
//   final String slug;
//   final DateTime dateAdded;
//   final DateTime lastUpdated;
//   CryptoCurrency(
//       {@required this.id,
//       @required this.numMarketPairs,
//       @required this.maxSupply,
//       @required this.circulatingSupply,
//       @required this.totalSupply,
//       @required this.name,
//       @required this.symbol,
//       @required this.slug,
//       @required this.dateAdded,
//       @required this.lastUpdated});
//   factory CryptoCurrency.fromData(
//       Map<String, dynamic> data, GeneratedDatabase db,
//       {String prefix}) {
//     final effectivePrefix = prefix ?? '';
//     final intType = db.typeSystem.forDartType<int>();
//     final stringType = db.typeSystem.forDartType<String>();
//     final dateTimeType = db.typeSystem.forDartType<DateTime>();
//     return CryptoCurrency(
//       id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
//       numMarketPairs: intType
//           .mapFromDatabaseResponse(data['${effectivePrefix}num_market_pairs']),
//       maxSupply:
//           intType.mapFromDatabaseResponse(data['${effectivePrefix}max_supply']),
//       circulatingSupply: intType.mapFromDatabaseResponse(
//           data['${effectivePrefix}circulating_supply']),
//       totalSupply: intType
//           .mapFromDatabaseResponse(data['${effectivePrefix}total_supply']),
//       name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
//       symbol:
//           stringType.mapFromDatabaseResponse(data['${effectivePrefix}symbol']),
//       slug: stringType.mapFromDatabaseResponse(data['${effectivePrefix}slug']),
//       dateAdded: dateTimeType
//           .mapFromDatabaseResponse(data['${effectivePrefix}date_added']),
//       lastUpdated: dateTimeType
//           .mapFromDatabaseResponse(data['${effectivePrefix}last_updated']),
//     );
//   }
//   @override
//   Map<String, Expression> toColumns(bool nullToAbsent) {
//     final map = <String, Expression>{};
//     if (!nullToAbsent || id != null) {
//       map['id'] = Variable<int>(id);
//     }
//     if (!nullToAbsent || numMarketPairs != null) {
//       map['num_market_pairs'] = Variable<int>(numMarketPairs);
//     }
//     if (!nullToAbsent || maxSupply != null) {
//       map['max_supply'] = Variable<int>(maxSupply);
//     }
//     if (!nullToAbsent || circulatingSupply != null) {
//       map['circulating_supply'] = Variable<int>(circulatingSupply);
//     }
//     if (!nullToAbsent || totalSupply != null) {
//       map['total_supply'] = Variable<int>(totalSupply);
//     }
//     if (!nullToAbsent || name != null) {
//       map['name'] = Variable<String>(name);
//     }
//     if (!nullToAbsent || symbol != null) {
//       map['symbol'] = Variable<String>(symbol);
//     }
//     if (!nullToAbsent || slug != null) {
//       map['slug'] = Variable<String>(slug);
//     }
//     if (!nullToAbsent || dateAdded != null) {
//       map['date_added'] = Variable<DateTime>(dateAdded);
//     }
//     if (!nullToAbsent || lastUpdated != null) {
//       map['last_updated'] = Variable<DateTime>(lastUpdated);
//     }
//     return map;
//   }

//   CryptoCurrenciesCompanion toCompanion(bool nullToAbsent) {
//     return CryptoCurrenciesCompanion(
//       id: id == null && nullToAbsent ? const Value.absent() : Value(id),
//       numMarketPairs: numMarketPairs == null && nullToAbsent
//           ? const Value.absent()
//           : Value(numMarketPairs),
//       maxSupply: maxSupply == null && nullToAbsent
//           ? const Value.absent()
//           : Value(maxSupply),
//       circulatingSupply: circulatingSupply == null && nullToAbsent
//           ? const Value.absent()
//           : Value(circulatingSupply),
//       totalSupply: totalSupply == null && nullToAbsent
//           ? const Value.absent()
//           : Value(totalSupply),
//       name: name == null && nullToAbsent ? const Value.absent() : Value(name),
//       symbol:
//           symbol == null && nullToAbsent ? const Value.absent() : Value(symbol),
//       slug: slug == null && nullToAbsent ? const Value.absent() : Value(slug),
//       dateAdded: dateAdded == null && nullToAbsent
//           ? const Value.absent()
//           : Value(dateAdded),
//       lastUpdated: lastUpdated == null && nullToAbsent
//           ? const Value.absent()
//           : Value(lastUpdated),
//     );
//   }

//   factory CryptoCurrency.fromJson(Map<String, dynamic> json,
//       {ValueSerializer serializer}) {
//     serializer ??= moorRuntimeOptions.defaultSerializer;
//     return CryptoCurrency(
//       id: serializer.fromJson<int>(json['id']),
//       numMarketPairs: serializer.fromJson<int>(json['numMarketPairs']),
//       maxSupply: serializer.fromJson<int>(json['maxSupply']),
//       circulatingSupply: serializer.fromJson<int>(json['circulatingSupply']),
//       totalSupply: serializer.fromJson<int>(json['totalSupply']),
//       name: serializer.fromJson<String>(json['name']),
//       symbol: serializer.fromJson<String>(json['symbol']),
//       slug: serializer.fromJson<String>(json['slug']),
//       dateAdded: serializer.fromJson<DateTime>(json['dateAdded']),
//       lastUpdated: serializer.fromJson<DateTime>(json['lastUpdated']),
//     );
//   }
//   @override
//   Map<String, dynamic> toJson({ValueSerializer serializer}) {
//     serializer ??= moorRuntimeOptions.defaultSerializer;
//     return <String, dynamic>{
//       'id': serializer.toJson<int>(id),
//       'numMarketPairs': serializer.toJson<int>(numMarketPairs),
//       'maxSupply': serializer.toJson<int>(maxSupply),
//       'circulatingSupply': serializer.toJson<int>(circulatingSupply),
//       'totalSupply': serializer.toJson<int>(totalSupply),
//       'name': serializer.toJson<String>(name),
//       'symbol': serializer.toJson<String>(symbol),
//       'slug': serializer.toJson<String>(slug),
//       'dateAdded': serializer.toJson<DateTime>(dateAdded),
//       'lastUpdated': serializer.toJson<DateTime>(lastUpdated),
//     };
//   }

//   CryptoCurrency copyWith(
//           {int id,
//           int numMarketPairs,
//           int maxSupply,
//           int circulatingSupply,
//           int totalSupply,
//           String name,
//           String symbol,
//           String slug,
//           DateTime dateAdded,
//           DateTime lastUpdated}) =>
//       CryptoCurrency(
//         id: id ?? this.id,
//         numMarketPairs: numMarketPairs ?? this.numMarketPairs,
//         maxSupply: maxSupply ?? this.maxSupply,
//         circulatingSupply: circulatingSupply ?? this.circulatingSupply,
//         totalSupply: totalSupply ?? this.totalSupply,
//         name: name ?? this.name,
//         symbol: symbol ?? this.symbol,
//         slug: slug ?? this.slug,
//         dateAdded: dateAdded ?? this.dateAdded,
//         lastUpdated: lastUpdated ?? this.lastUpdated,
//       );
//   @override
//   String toString() {
//     return (StringBuffer('CryptoCurrency(')
//           ..write('id: $id, ')
//           ..write('numMarketPairs: $numMarketPairs, ')
//           ..write('maxSupply: $maxSupply, ')
//           ..write('circulatingSupply: $circulatingSupply, ')
//           ..write('totalSupply: $totalSupply, ')
//           ..write('name: $name, ')
//           ..write('symbol: $symbol, ')
//           ..write('slug: $slug, ')
//           ..write('dateAdded: $dateAdded, ')
//           ..write('lastUpdated: $lastUpdated')
//           ..write(')'))
//         .toString();
//   }

//   @override
//   int get hashCode => $mrjf($mrjc(
//       id.hashCode,
//       $mrjc(
//           numMarketPairs.hashCode,
//           $mrjc(
//               maxSupply.hashCode,
//               $mrjc(
//                   circulatingSupply.hashCode,
//                   $mrjc(
//                       totalSupply.hashCode,
//                       $mrjc(
//                           name.hashCode,
//                           $mrjc(
//                               symbol.hashCode,
//                               $mrjc(
//                                   slug.hashCode,
//                                   $mrjc(dateAdded.hashCode,
//                                       lastUpdated.hashCode))))))))));
//   @override
//   bool operator ==(dynamic other) =>
//       identical(this, other) ||
//       (other is CryptoCurrency &&
//           other.id == this.id &&
//           other.numMarketPairs == this.numMarketPairs &&
//           other.maxSupply == this.maxSupply &&
//           other.circulatingSupply == this.circulatingSupply &&
//           other.totalSupply == this.totalSupply &&
//           other.name == this.name &&
//           other.symbol == this.symbol &&
//           other.slug == this.slug &&
//           other.dateAdded == this.dateAdded &&
//           other.lastUpdated == this.lastUpdated);
// }

// class CryptoCurrenciesCompanion extends UpdateCompanion<CryptoCurrency> {
//   final Value<int> id;
//   final Value<int> numMarketPairs;
//   final Value<int> maxSupply;
//   final Value<int> circulatingSupply;
//   final Value<int> totalSupply;
//   final Value<String> name;
//   final Value<String> symbol;
//   final Value<String> slug;
//   final Value<DateTime> dateAdded;
//   final Value<DateTime> lastUpdated;
//   const CryptoCurrenciesCompanion({
//     this.id = const Value.absent(),
//     this.numMarketPairs = const Value.absent(),
//     this.maxSupply = const Value.absent(),
//     this.circulatingSupply = const Value.absent(),
//     this.totalSupply = const Value.absent(),
//     this.name = const Value.absent(),
//     this.symbol = const Value.absent(),
//     this.slug = const Value.absent(),
//     this.dateAdded = const Value.absent(),
//     this.lastUpdated = const Value.absent(),
//   });
//   CryptoCurrenciesCompanion.insert({
//     @required int id,
//     @required int numMarketPairs,
//     @required int maxSupply,
//     @required int circulatingSupply,
//     @required int totalSupply,
//     @required String name,
//     @required String symbol,
//     @required String slug,
//     @required DateTime dateAdded,
//     @required DateTime lastUpdated,
//   })  : id = Value(id),
//         numMarketPairs = Value(numMarketPairs),
//         maxSupply = Value(maxSupply),
//         circulatingSupply = Value(circulatingSupply),
//         totalSupply = Value(totalSupply),
//         name = Value(name),
//         symbol = Value(symbol),
//         slug = Value(slug),
//         dateAdded = Value(dateAdded),
//         lastUpdated = Value(lastUpdated);
//   static Insertable<CryptoCurrency> custom({
//     Expression<int> id,
//     Expression<int> numMarketPairs,
//     Expression<int> maxSupply,
//     Expression<int> circulatingSupply,
//     Expression<int> totalSupply,
//     Expression<String> name,
//     Expression<String> symbol,
//     Expression<String> slug,
//     Expression<DateTime> dateAdded,
//     Expression<DateTime> lastUpdated,
//   }) {
//     return RawValuesInsertable({
//       if (id != null) 'id': id,
//       if (numMarketPairs != null) 'num_market_pairs': numMarketPairs,
//       if (maxSupply != null) 'max_supply': maxSupply,
//       if (circulatingSupply != null) 'circulating_supply': circulatingSupply,
//       if (totalSupply != null) 'total_supply': totalSupply,
//       if (name != null) 'name': name,
//       if (symbol != null) 'symbol': symbol,
//       if (slug != null) 'slug': slug,
//       if (dateAdded != null) 'date_added': dateAdded,
//       if (lastUpdated != null) 'last_updated': lastUpdated,
//     });
//   }

//   CryptoCurrenciesCompanion copyWith(
//       {Value<int> id,
//       Value<int> numMarketPairs,
//       Value<int> maxSupply,
//       Value<int> circulatingSupply,
//       Value<int> totalSupply,
//       Value<String> name,
//       Value<String> symbol,
//       Value<String> slug,
//       Value<DateTime> dateAdded,
//       Value<DateTime> lastUpdated}) {
//     return CryptoCurrenciesCompanion(
//       id: id ?? this.id,
//       numMarketPairs: numMarketPairs ?? this.numMarketPairs,
//       maxSupply: maxSupply ?? this.maxSupply,
//       circulatingSupply: circulatingSupply ?? this.circulatingSupply,
//       totalSupply: totalSupply ?? this.totalSupply,
//       name: name ?? this.name,
//       symbol: symbol ?? this.symbol,
//       slug: slug ?? this.slug,
//       dateAdded: dateAdded ?? this.dateAdded,
//       lastUpdated: lastUpdated ?? this.lastUpdated,
//     );
//   }

//   @override
//   Map<String, Expression> toColumns(bool nullToAbsent) {
//     final map = <String, Expression>{};
//     if (id.present) {
//       map['id'] = Variable<int>(id.value);
//     }
//     if (numMarketPairs.present) {
//       map['num_market_pairs'] = Variable<int>(numMarketPairs.value);
//     }
//     if (maxSupply.present) {
//       map['max_supply'] = Variable<int>(maxSupply.value);
//     }
//     if (circulatingSupply.present) {
//       map['circulating_supply'] = Variable<int>(circulatingSupply.value);
//     }
//     if (totalSupply.present) {
//       map['total_supply'] = Variable<int>(totalSupply.value);
//     }
//     if (name.present) {
//       map['name'] = Variable<String>(name.value);
//     }
//     if (symbol.present) {
//       map['symbol'] = Variable<String>(symbol.value);
//     }
//     if (slug.present) {
//       map['slug'] = Variable<String>(slug.value);
//     }
//     if (dateAdded.present) {
//       map['date_added'] = Variable<DateTime>(dateAdded.value);
//     }
//     if (lastUpdated.present) {
//       map['last_updated'] = Variable<DateTime>(lastUpdated.value);
//     }
//     return map;
//   }

//   @override
//   String toString() {
//     return (StringBuffer('CryptoCurrenciesCompanion(')
//           ..write('id: $id, ')
//           ..write('numMarketPairs: $numMarketPairs, ')
//           ..write('maxSupply: $maxSupply, ')
//           ..write('circulatingSupply: $circulatingSupply, ')
//           ..write('totalSupply: $totalSupply, ')
//           ..write('name: $name, ')
//           ..write('symbol: $symbol, ')
//           ..write('slug: $slug, ')
//           ..write('dateAdded: $dateAdded, ')
//           ..write('lastUpdated: $lastUpdated')
//           ..write(')'))
//         .toString();
//   }
// }

// class $CryptoCurrenciesTable extends CryptoCurrencies
//     with TableInfo<$CryptoCurrenciesTable, CryptoCurrency> {
//   final GeneratedDatabase _db;
//   final String _alias;
//   $CryptoCurrenciesTable(this._db, [this._alias]);
//   final VerificationMeta _idMeta = const VerificationMeta('id');
//   GeneratedIntColumn _id;
//   @override
//   GeneratedIntColumn get id => _id ??= _constructId();
//   GeneratedIntColumn _constructId() {
//     return GeneratedIntColumn(
//       'id',
//       $tableName,
//       false,
//     );
//   }

//   final VerificationMeta _numMarketPairsMeta =
//       const VerificationMeta('numMarketPairs');
//   GeneratedIntColumn _numMarketPairs;
//   @override
//   GeneratedIntColumn get numMarketPairs =>
//       _numMarketPairs ??= _constructNumMarketPairs();
//   GeneratedIntColumn _constructNumMarketPairs() {
//     return GeneratedIntColumn(
//       'num_market_pairs',
//       $tableName,
//       false,
//     );
//   }

//   final VerificationMeta _maxSupplyMeta = const VerificationMeta('maxSupply');
//   GeneratedIntColumn _maxSupply;
//   @override
//   GeneratedIntColumn get maxSupply => _maxSupply ??= _constructMaxSupply();
//   GeneratedIntColumn _constructMaxSupply() {
//     return GeneratedIntColumn(
//       'max_supply',
//       $tableName,
//       false,
//     );
//   }

//   final VerificationMeta _circulatingSupplyMeta =
//       const VerificationMeta('circulatingSupply');
//   GeneratedIntColumn _circulatingSupply;
//   @override
//   GeneratedIntColumn get circulatingSupply =>
//       _circulatingSupply ??= _constructCirculatingSupply();
//   GeneratedIntColumn _constructCirculatingSupply() {
//     return GeneratedIntColumn(
//       'circulating_supply',
//       $tableName,
//       false,
//     );
//   }

//   final VerificationMeta _totalSupplyMeta =
//       const VerificationMeta('totalSupply');
//   GeneratedIntColumn _totalSupply;
//   @override
//   GeneratedIntColumn get totalSupply =>
//       _totalSupply ??= _constructTotalSupply();
//   GeneratedIntColumn _constructTotalSupply() {
//     return GeneratedIntColumn(
//       'total_supply',
//       $tableName,
//       false,
//     );
//   }

//   final VerificationMeta _nameMeta = const VerificationMeta('name');
//   GeneratedTextColumn _name;
//   @override
//   GeneratedTextColumn get name => _name ??= _constructName();
//   GeneratedTextColumn _constructName() {
//     return GeneratedTextColumn('name', $tableName, false,
//         minTextLength: 2, maxTextLength: 32);
//   }

//   final VerificationMeta _symbolMeta = const VerificationMeta('symbol');
//   GeneratedTextColumn _symbol;
//   @override
//   GeneratedTextColumn get symbol => _symbol ??= _constructSymbol();
//   GeneratedTextColumn _constructSymbol() {
//     return GeneratedTextColumn('symbol', $tableName, false,
//         minTextLength: 2, maxTextLength: 8);
//   }

//   final VerificationMeta _slugMeta = const VerificationMeta('slug');
//   GeneratedTextColumn _slug;
//   @override
//   GeneratedTextColumn get slug => _slug ??= _constructSlug();
//   GeneratedTextColumn _constructSlug() {
//     return GeneratedTextColumn('slug', $tableName, false,
//         minTextLength: 2, maxTextLength: 32);
//   }

//   final VerificationMeta _dateAddedMeta = const VerificationMeta('dateAdded');
//   GeneratedDateTimeColumn _dateAdded;
//   @override
//   GeneratedDateTimeColumn get dateAdded => _dateAdded ??= _constructDateAdded();
//   GeneratedDateTimeColumn _constructDateAdded() {
//     return GeneratedDateTimeColumn(
//       'date_added',
//       $tableName,
//       false,
//     );
//   }

//   final VerificationMeta _lastUpdatedMeta =
//       const VerificationMeta('lastUpdated');
//   GeneratedDateTimeColumn _lastUpdated;
//   @override
//   GeneratedDateTimeColumn get lastUpdated =>
//       _lastUpdated ??= _constructLastUpdated();
//   GeneratedDateTimeColumn _constructLastUpdated() {
//     return GeneratedDateTimeColumn(
//       'last_updated',
//       $tableName,
//       false,
//     );
//   }

//   @override
//   List<GeneratedColumn> get $columns => [
//         id,
//         numMarketPairs,
//         maxSupply,
//         circulatingSupply,
//         totalSupply,
//         name,
//         symbol,
//         slug,
//         dateAdded,
//         lastUpdated
//       ];
//   @override
//   $CryptoCurrenciesTable get asDslTable => this;
//   @override
//   String get $tableName => _alias ?? 'crypto_currencies';
//   @override
//   final String actualTableName = 'crypto_currencies';
//   @override
//   VerificationContext validateIntegrity(Insertable<CryptoCurrency> instance,
//       {bool isInserting = false}) {
//     final context = VerificationContext();
//     final data = instance.toColumns(true);
//     if (data.containsKey('id')) {
//       context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
//     } else if (isInserting) {
//       context.missing(_idMeta);
//     }
//     if (data.containsKey('num_market_pairs')) {
//       context.handle(
//           _numMarketPairsMeta,
//           numMarketPairs.isAcceptableOrUnknown(
//               data['num_market_pairs'], _numMarketPairsMeta));
//     } else if (isInserting) {
//       context.missing(_numMarketPairsMeta);
//     }
//     if (data.containsKey('max_supply')) {
//       context.handle(_maxSupplyMeta,
//           maxSupply.isAcceptableOrUnknown(data['max_supply'], _maxSupplyMeta));
//     } else if (isInserting) {
//       context.missing(_maxSupplyMeta);
//     }
//     if (data.containsKey('circulating_supply')) {
//       context.handle(
//           _circulatingSupplyMeta,
//           circulatingSupply.isAcceptableOrUnknown(
//               data['circulating_supply'], _circulatingSupplyMeta));
//     } else if (isInserting) {
//       context.missing(_circulatingSupplyMeta);
//     }
//     if (data.containsKey('total_supply')) {
//       context.handle(
//           _totalSupplyMeta,
//           totalSupply.isAcceptableOrUnknown(
//               data['total_supply'], _totalSupplyMeta));
//     } else if (isInserting) {
//       context.missing(_totalSupplyMeta);
//     }
//     if (data.containsKey('name')) {
//       context.handle(
//           _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
//     } else if (isInserting) {
//       context.missing(_nameMeta);
//     }
//     if (data.containsKey('symbol')) {
//       context.handle(_symbolMeta,
//           symbol.isAcceptableOrUnknown(data['symbol'], _symbolMeta));
//     } else if (isInserting) {
//       context.missing(_symbolMeta);
//     }
//     if (data.containsKey('slug')) {
//       context.handle(
//           _slugMeta, slug.isAcceptableOrUnknown(data['slug'], _slugMeta));
//     } else if (isInserting) {
//       context.missing(_slugMeta);
//     }
//     if (data.containsKey('date_added')) {
//       context.handle(_dateAddedMeta,
//           dateAdded.isAcceptableOrUnknown(data['date_added'], _dateAddedMeta));
//     } else if (isInserting) {
//       context.missing(_dateAddedMeta);
//     }
//     if (data.containsKey('last_updated')) {
//       context.handle(
//           _lastUpdatedMeta,
//           lastUpdated.isAcceptableOrUnknown(
//               data['last_updated'], _lastUpdatedMeta));
//     } else if (isInserting) {
//       context.missing(_lastUpdatedMeta);
//     }
//     return context;
//   }

//   @override
//   Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
//   @override
//   CryptoCurrency map(Map<String, dynamic> data, {String tablePrefix}) {
//     final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
//     return CryptoCurrency.fromData(data, _db, prefix: effectivePrefix);
//   }

//   @override
//   $CryptoCurrenciesTable createAlias(String alias) {
//     return $CryptoCurrenciesTable(_db, alias);
//   }
// }

// abstract class _$AppDatabase extends GeneratedDatabase {
//   _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
//   $CryptoCurrenciesTable _cryptoCurrencies;
//   $CryptoCurrenciesTable get cryptoCurrencies =>
//       _cryptoCurrencies ??= $CryptoCurrenciesTable(this);
//   @override
//   Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
//   @override
//   List<DatabaseSchemaEntity> get allSchemaEntities => [cryptoCurrencies];
// }
