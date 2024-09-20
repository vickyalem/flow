import 'package:flow/data/database/database.dart';
import 'package:flow/data/repository/entry_repo.dart';
import 'package:flow/viewModel/entry_view_model.dart';
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
        // home: landing page,
        home: const MainBody(),
      ),
    );
  }
}
