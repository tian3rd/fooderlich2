import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

import '../models/models.dart';

class GroceryItemScreen extends StatefulWidget {
  final Function(GroceryItem) onCreate;
  final Function(GroceryItem) onUpdate;
  final GroceryItem? originalItem;
  final bool isUpdating;

  const GroceryItemScreen({
    Key? key,
    required this.onCreate,
    required this.onUpdate,
    this.originalItem,
}) : isUpdating = originalItem != null, super(key: key);

  @override
  _GroceryItemScreenState createState() => _GroceryItemScreenState();
}

class _GroceryItemScreenState extends State<GroceryItemScreen> {
  // TODO: add grocery item screen state properties

  @override
  Widget build(BuildContext context) {
    // TODO 12: add GroceryItemScreen scaffold
    return Container(color: Colors.orange,);
  }

  // TODO: add buildNameField()

// TODO: add buildImportanceField()

// TODO: add buildDateField()

// TODO: add buildTimeField()

// TODO: add buildColorPicker()

// TODO: add buildQuantityField()

}