import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';
import 'empty_grocery_screen.dart';

class GroceryScreen extends StatelessWidget {
  const GroceryScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO 2: Replace with EmptyGroceryScreen
    // return EmptyGroceryScreen();
    // return buildGroceryScreen(context);
    // TODO: add a scaffold widget
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
      body: buildGroceryScreen(context),
    );
  }
  // TODO: add buildGroceryScreen
  Widget buildGroceryScreen(BuildContext context) {
    return Consumer<GroceryManager>(
        builder: (context, groceryManager, child) {
          if (groceryManager.groceryItems.isNotEmpty) {
            // TODO 25: add GroceryListScreen
            return Container();
          } else {
            return EmptyGroceryScreen();
          }
        }
    );
  }
}