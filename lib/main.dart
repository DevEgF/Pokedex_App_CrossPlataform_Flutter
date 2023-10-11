import 'package:flutter/material.dart';
import 'package:pokedex_app/app/presentation/pages/pokedex_page.dart';
import 'package:pokedex_app/di/locator.dart';

void main() {
  setupDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Pokedex',
      theme: ThemeData(primarySwatch: Colors.red),
      home: PokedexPage(),
    );
  }
}
