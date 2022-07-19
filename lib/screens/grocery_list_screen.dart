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
          return Dismissible(
            key: Key(groceryItem.id),
            direction: DismissDirection.endToStart,
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              child: const SizedBox(
                width: 80,
                child: Icon(
                  Icons.delete_forever,
                  color: Colors.white,
                  size: 48,
                ),
              ),
            ),
            onDismissed: (direction) {
              groceryManager.deleteItem(index);
              // show SnackBar to indicate item has been deleted
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('${groceryItem.name} deleted'),
                ),
              );
            },
            child: InkWell(
              child: GroceryTile(
                key: Key(groceryItem.id),
                groceryItem: groceryItem,
                onComplete: (change) {
                  if (change != null) {
                    groceryManager.completeItem(index, change);
                  }
                },
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GroceryItemScreen(
                      originalItem: groceryItem,
                      onCreate: (groceryItem) {},
                      onUpdate: (groceryItem) {
                        groceryManager.updateItem(groceryItem, index);
                        Navigator.pop(context);
                      },
                    ),
                  ),
                );
              },
            ),
          );

        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 16);
        },
      ),
    );
  }
}