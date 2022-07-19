import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../models/grocery_item.dart';

class GroceryTile extends StatelessWidget {
  final GroceryItem groceryItem;

  final Function(bool?)? onComplete;

  final TextDecoration textDecoration;

  GroceryTile({
    Key? key,
    required this.groceryItem,
    this.onComplete,
  })  : textDecoration = groceryItem.isComplete
            ? TextDecoration.lineThrough
            : TextDecoration.none,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO 21: change this widget
    return Container(
      height: 100,
      // TODO 20: replace this color
      color: groceryItem.color,
    );
  }

  // TODO: add buildImportance()
  Widget buildImportance() {
    if (groceryItem.importance == Importance.high) {
      return Text(
        'High',
        style: GoogleFonts.pacifico(
          fontSize: 12,
          color: Colors.red,
        ),
      );
    } else if (groceryItem.importance == Importance.medium) {
      return Text(
        'Medium',
        style: GoogleFonts.pacifico(
          fontSize: 12,
          color: Colors.yellow,
        ),
      );
    } else if (groceryItem.importance == Importance.low) {
      return Text(
        'Low',
        style: GoogleFonts.pacifico(
          fontSize: 12,
          color: Colors.green,
        ),
      );
    } else {
      throw Exception('Unknown importance');
    }
  }

  // TODO: add buildDate()

  // TODO: add buildCheckbox()
}
