import 'package:drift_db_viewer/drift_db_viewer.dart';
import 'package:flow/data/database/database.dart';
import 'package:flow/views/editing_page.dart';
import 'package:flow/views/home_page.dart';
import 'package:flow/views/profile_page.dart';
import 'package:flow/views/sharing_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainBody extends StatefulWidget {
  const MainBody({super.key});

  @override
  State<MainBody> createState() => _MainBodyState();
}

class _MainBodyState extends State<MainBody> {
  int currentPageIndex = 0;
  final List<Widget> _body = <Widget>[
    const HomePage(),
    const SharingPage(),
    const ProfilePage(),
  ];

  final List<String> _titles = <String>['Home', 'Sharing', 'Profile'];

  List<Widget> _actions(BuildContext context) {
    final database = Provider.of<AppDatabase>(context);

    switch (currentPageIndex) {
      case 0:
        return [
          IconButton(
            icon: Icon(
              Icons.more_vert,
              color: Theme.of(context).colorScheme.secondary,
            ),
            tooltip: 'Show Snackbar',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DriftDbViewer(database)),
              );
            },
          ),
          IconButton(
            icon: Icon(
              Icons.add_circle,
              color: Theme.of(context).colorScheme.primary,
            ),
            tooltip: 'Go to the next page',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const EditingPage()),
              );
            },
          ),
        ];
      default:
        return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceDim,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surfaceDim,
        title: Text(_titles[currentPageIndex]),
        actions: _actions(context),
      ),
      body: _body[currentPageIndex],
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) =>
            setState(() => currentPageIndex = index),
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.diversity_1),
            label: 'Sharing',
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
