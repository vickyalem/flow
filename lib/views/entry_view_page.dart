import 'package:flow/model/entry.dart';
import 'package:flow/viewModel/entry_view_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EntryViewPage extends StatelessWidget {
  const EntryViewPage(
      {super.key, required this.entry, required this.viewModel});

  final EntryModel entry;
  final EntryViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController(text: entry.title);
    final contentController = TextEditingController(text: entry.content);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.chevron_left),
        ),
        title: Text(
          DateFormat('EEEE, d MMM yyyy').format(entry.createdAt),
          style: const TextStyle(fontSize: 18),
        ),
        actions: [
          TextButton(
            onPressed: () {
              viewModel.updateEntry(EntryModel(
                id: entry.id,
                title: titleController.text,
                content: contentController.text,
                createdAt: entry.createdAt,
              ));
              Navigator.pop(context);
            },
            child: const Text('Done'),
          ),
        ],
      ),
      // end of app bar
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Title TextField
            TextFormField(
              controller: titleController,
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // Content TextField
            Expanded(
              child: TextFormField(
                controller: contentController,
                maxLines: null,
                expands: true,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
      // end of body
    );
  }
}
