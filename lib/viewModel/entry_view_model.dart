import 'package:flow/data/repository/entry_repo.dart';
import 'package:flow/model/entry.dart';
import 'package:flutter/cupertino.dart';

class EntryViewModel extends ChangeNotifier {
  final EntryRepo _repository;
  List<EntryModel> _entries = [];

  EntryViewModel(this._repository);

  List<EntryModel> get entries => _entries;

  Future<void> fetchEntries() async {
    _entries = await _repository.getAllEntries();
    notifyListeners();
  }

  Future<void> addEntry(String title, String content, DateTime createdAt) async {
    await _repository.insertEntry(title, content, createdAt);
    await fetchEntries();
  }

  Future<void> deleteEntry(int id) async {
    await _repository.deleteEntry(id);
    await fetchEntries(); 
  }
}