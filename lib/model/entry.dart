import '../data/database/database.dart';

class EntryModel {
  final int id;
  final String title;
  final String content;
  final DateTime createdAt;

  EntryModel({required this.id, required this.title, required this.content, required this.createdAt});

  factory EntryModel.fromDriftEntry(Entry entry) {
    return EntryModel(id: entry.id, title: entry.title, content: entry.content, createdAt: entry.createdAt);
  }
}