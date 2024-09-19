import 'package:flow/data/database/database.dart';
import 'package:flow/model/entry.dart';

class EntryRepo {
  final AppDatabase _appDatabase;

  EntryRepo(this._appDatabase);

  Future<List<EntryModel>> getAllEntries() async {
    final users = await _appDatabase.getAllEntries();
    return users.map((u) => EntryModel.fromDriftEntry(u)).toList();
  }

  Future<void> insertEntry(String title, String content, DateTime createdAt) async {
    await _appDatabase.insertEntry(EntriesCompanion.insert(title: title, content: content, createdAt: createdAt));
  }

  Future<void> deleteEntry(int id) async {
    await _appDatabase.deleteEntry(id);
  }
}