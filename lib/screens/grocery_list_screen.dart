import 'package:flutter/material.dart';

import '../components/components.dart';
import '../models/models.dart';
import 'grocery_item_screen.dart';

class GroceryListScreen extends StatelessWidget {
  final GroceryManager groceryManager;

  const GroceryListScreen({
    Key? key,
    required this.groceryManager,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO 26: replace with ListView
    final groceryItems = groceryManager.groceryItems;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView.separated(
        itemCount: groceryItems.length,
        itemBuilder: (context, index) {
          final groceryItem = groceryItems[index];
          // TODO 28: wrap in a Dismissable?
          // TODO 27: Wrap in an InkWell?
          return GroceryTile(
            // add unique key here
            key: Key(groceryItem.id),
            groceryItem: groceryItem,
            onComplete: (change) {
              if (change != null) {
                groceryManager.completeItem(index, change);
              }
            },
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 16);
        },
      ),
    );
  }
}