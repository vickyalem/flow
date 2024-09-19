import 'package:drift/drift.dart';
import 'package:drift/native.dart';

part 'database.g.dart';

class Entries extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get content => text()();
  DateTimeColumn get createdAt => dateTime()();
}

@DriftDatabase(tables: [Entries])
class AppDatabase extends _$AppDatabase {
  // After generating code, this class needs to define a `schemaVersion` getter
  // and a constructor telling drift where the database should be stored.
  // These are described in the getting started guide: https://drift.simonbinder.eu/getting-started/#open
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<List<Entry>> getAllEntries() => select(entries).get();
  Future<int> insertEntry(EntriesCompanion entry) =>
      into(entries).insert(entry);
  Future<int> deleteEntry(int id) =>
      (delete(entries)..where((u) => u.id.equals(id))).go();

  static QueryExecutor _openConnection() {
    // `driftDatabase` from `package:drift_flutter` stores the database in
    // `getApplicationDocumentsDirectory()`.

    //persist database
    //return driftDatabase(name: 'my_database');

    //temporary in memory database
    return NativeDatabase.memory();
  }
}
