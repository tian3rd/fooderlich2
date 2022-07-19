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
    return SizedBox(
      height: 100,
      // TODO 20: replace this color
      // color: groceryItem.color,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // TODO 22: add Row to group (name, date, importance)
          Row(
            children: [
              Container(
                width: 5,
                color: groceryItem.color,
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Text(
                  //   'Preview',
                  //   style: GoogleFonts.roboto(
                  //     fontSize: 10,
                  //     color: Colors.blueGrey.withOpacity(0.8),
                  //   ),
                  // ),
                  Text(
                    groceryItem.name,
                    style: GoogleFonts.lato(
                      decoration: textDecoration,
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  buildDate(),
                  const SizedBox(
                    height: 6,
                  ),
                  buildImportance(),
                ],
              ),
            ],
          ),
          // TODO 23: add Row to group (quantity, checkbox)
          Row(
            children: [
              Text(
                '${groceryItem.quantity}',
                style: GoogleFonts.lato(
                  fontSize: 24,
                  decoration: textDecoration,
                ),
              ),
              const SizedBox(width: 8),
              buildCheckbox(),
            ],
          ),
        ],
      ),
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
          color: Colors.orange,
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
  Widget buildDate() {
    final dateFormatter = DateFormat('MMMM dd h:mm a');
    final dateString = dateFormatter.format(groceryItem.date);
    return Text(
      dateString,
      style: TextStyle(decoration: textDecoration),
    );
  }

  // TODO: add buildCheckbox()
  Widget buildCheckbox() {
    return Checkbox(
      value: groceryItem.isComplete,
      onChanged: onComplete,
    );
  }
}
