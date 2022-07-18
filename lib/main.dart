import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'fooderlich_theme.dart';
import 'home.dart';
import 'models/models.dart';

void main() {
  runApp(const Fooderlich());
}

class Fooderlich extends StatelessWidget {
  const Fooderlich({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = FooderlichTheme.light();
    return MaterialApp(
      theme: theme,
      title: 'Fooderlich',
      // TODO: replace Home with MultiProvider
      // home: const Home(),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => TabManger()
          ),
          // TODO 10: add GroceryManager Provider
          ChangeNotifierProvider(
            create: (context) => GroceryManager()
          ),
        ],
        child: const Home(),
      )
    );
  }
}
