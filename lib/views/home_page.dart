import 'package:flow/viewModel/entry_view_model.dart';
import 'package:flow/views/editing_page.dart';
import 'package:flow/widgets/customCard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<EntryViewModel>(builder: (context, viewModel, child) {
      viewModel.fetchEntries();
      var entries = viewModel.entries;
      if (entries.isEmpty) {
        return Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("There are currently no entries.",
                style: Theme.of(context).textTheme.bodyLarge),
            const SizedBox(
              height: 10,
            ),
            OutlinedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EditingPage()));
                },
                child: const Text("Start Writing"))
          ],
        ));
      } else {
        return ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(12.0),
              child: SearchBar(
                  backgroundColor: MaterialStateProperty.all(
                      Theme.of(context).colorScheme.surface),
                  hintText: 'Search your Journal Entries',
                  leading: const Icon(Icons.search),
                  elevation: WidgetStateProperty.all<double?>(0.0)),
            ),
            for (var entry in entries)
              GestureDetector(
                  onLongPressStart: (details) {
                    _showContextMenu(
                        context, viewModel, entry.id, details.globalPosition);
                  },
                  onSecondaryTapDown: (details) {
                    _showContextMenu(
                        context, viewModel, entry.id, details.globalPosition);
                  },
                  child: CustomCard(
                    title: entry.title,
                    body: entry.content,
                    createdAt: entry.createdAt,
                  )),
          ],
        );
      }
    });
  }

  // end of build method
  void _showContextMenu(
      BuildContext context, EntryViewModel viewModel, int id, Offset position) {
    showMenu(
      context: context,
      position: RelativeRect.fromRect(
        Rect.fromPoints(
          position,
          position,
        ),
        Offset.zero & MediaQuery.of(context).size,
      ),
      items: [
        const PopupMenuItem(value: 'delete', child: Text('Delete entry'))
      ],
    ).then((value) {
      if (value != null) {
        viewModel.deleteEntry(id);
      }
    });
  }
}
