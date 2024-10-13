import 'package:flutter/material.dart';
import 'package:flutter_channels/names_example.g.dart';
import 'package:flutter_channels/platform_names_example.dart';

void main() {
  final storage = NamesStorage();
  final repo = PlatformNamesExample(storage);
  runApp(MyApp(
    repo: repo,
  ));
}

class MyApp extends StatelessWidget {
  final PlatformNamesExample repo;

  const MyApp({
    super.key,
    required this.repo,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter + native',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeScreen(repo: repo),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final PlatformNamesExample repo;

  const HomeScreen({
    super.key,
    required this.repo,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextButton(
              onPressed: () async {
                final name = await repo.getName("id");
                print(name);
              },
              child: Text("Get name")),
          TextButton(
              onPressed: () async {
                await repo.addName("id", "id");
              },
              child: Text("Save  name")),
          TextButton(
              onPressed: () async {
                final names = await repo.getNames();
                print(names);
              },
              child: Text("Get all names")),
        ],
      ),
    );
  }
}
