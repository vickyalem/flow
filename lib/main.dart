import 'package:flow/data/database/database.dart';
import 'package:flow/data/repository/entry_repo.dart';
import 'package:flow/viewModel/entryViewModel.dart';
import 'package:flow/views/main_body.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final database = AppDatabase();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => database),
        Provider(create: (_) => EntryRepo(database)),
        ChangeNotifierProxyProvider<EntryRepo, EntryViewModel>(
          create: (context) => EntryViewModel(context.read<EntryRepo>()),
          update: (context, repository, viewModel) =>
              EntryViewModel(repository),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
        ),
        // home: const NavigationExample(),
        home: const MainBody(),
      ),
    );
  }
}

// class NavigationExample extends StatefulWidget {
//   const NavigationExample({super.key});

//   @override
//   State<NavigationExample> createState() => _NavigationExampleState();
// }

// class _NavigationExampleState extends State<NavigationExample> {
//   int currentPageIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     var entryModel = context.watch<EntryModel>();

//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('Home'),
//           actions: <Widget>[
//             IconButton(
//               icon: const Icon(Icons.more_vert),
//               tooltip: 'Show Snackbar',
//               onPressed: () {
//                 ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(content: Text('This is a snackbar')));
//               },
//             ),
//             IconButton(
//               icon: const Icon(Icons.add_circle),
//               tooltip: 'Go to the next page',
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => const NoteEditor()),
//                 );
//               },
//             ),
//           ],
//         ),
//         bottomNavigationBar: NavigationBar(
//           onDestinationSelected: (int index) {
//             setState(() {
//               currentPageIndex = index;
//             });
//           },
//           selectedIndex: currentPageIndex,
//           destinations: const <Widget>[
//             NavigationDestination(
//               selectedIcon: Icon(Icons.home),
//               icon: Icon(Icons.home_rounded),
//               label: 'Home',
//             ),
//             NavigationDestination(
//               icon: Icon(Icons.diversity_1),
//               label: 'Sharing',
//             ),
//             NavigationDestination(
//               icon: Icon(Icons.person),
//               label: 'Profile',
//             ),
//           ],
//         ),
//         body: Column(
//           children: [
//             Container(
//               padding: const EdgeInsets.all(12.0),
//               child: SearchBar(
//                   hintText: 'Search your Journal Entries',
//                   leading: const Icon(Icons.search),
//                   elevation: WidgetStateProperty.all<double?>(0.0)),
//             ),
//             for (var pair in entryModel.entries)
//               CustomCard(title: pair.title, body: pair.body),
//           ],
//         ));
//   }
// }
