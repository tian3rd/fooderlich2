import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

import '../models/models.dart';
import '../components/grocery_tile.dart';

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
  })  : isUpdating = originalItem != null,
        super(key: key);

  @override
  _GroceryItemScreenState createState() => _GroceryItemScreenState();
}

class _GroceryItemScreenState extends State<GroceryItemScreen> {
  // TODO: add grocery item screen state properties
  final _nameController = TextEditingController();
  String _name = '';
  Importance _importance = Importance.low;
  DateTime _dueDate = DateTime.now();
  TimeOfDay _timeOfDay = TimeOfDay.now();
  Color _currentColor = Colors.green;
  int _currentSliderValue = 0;

  // TODO: add initState()
  @override
  void initState() {
    final originalItem = widget.originalItem;
    if (originalItem != null) {
      _nameController.text = originalItem.name;
      _name = originalItem.name;
      _importance = originalItem.importance;
      _currentColor = originalItem.color;
      final date = originalItem.date; // why is this final?
      _timeOfDay = TimeOfDay(hour: date.hour, minute: date.minute);
      _dueDate = date;
      _currentSliderValue = originalItem.quantity;
    }

    _nameController.addListener(() {
      setState(() {
        _name = _nameController.text;
      });
    });

    super.initState();
  }

  // TODO: add dispose()
  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO 12: add GroceryItemScreen scaffold
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {
              // TODO 24: add callback handler
              final groceryItem = GroceryItem(
                id: widget.originalItem?.id ?? Uuid().v1(),
                name: _nameController.text,
                importance: _importance,
                color: _currentColor,
                quantity: _currentSliderValue,
                date: DateTime(
                  _dueDate.year,
                  _dueDate.month,
                  _dueDate.day,
                  _timeOfDay.hour,
                  _timeOfDay.minute,
                ),
              );

              if (widget.isUpdating) {
                widget.onUpdate(groceryItem);
              } else {
                widget.onCreate(groceryItem);
              }
            },
          ),
        ],
        elevation: 0,
        title: Text(
          'Grocery Item',
          style: GoogleFonts.lato(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            // TODO 13: add name TextField
            buildNameField(),
            // TODO 14: add Importance selection
            buildImportanceField(),
            // TODO 15: add date picker
            buildDateField(context),
            // TODO 16: add time picker
            buildTimeField(context),
            // TODO 17: add color picker
            const SizedBox(height: 8),
            buildColorPicker(context),
            // TODO 18: add slider
            const SizedBox(height: 8),
            buildQuantityField(),
            // TODO 19: add grocery tile
            GroceryTile(
              groceryItem: GroceryItem(
                id: 'preview_placeholder',
                name: _name,
                importance: _importance,
                color: _currentColor,
                quantity: _currentSliderValue,
                date: DateTime(
                  _dueDate.year,
                  _dueDate.month,
                  _dueDate.day,
                  _timeOfDay.hour,
                  _timeOfDay.minute,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

// TODO: add buildNameField()
  Widget buildNameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Item Name',
          style: GoogleFonts.lato(
            fontSize: 28,
          ),
        ),
        TextField(
          controller: _nameController,
          cursorColor: _currentColor,
          decoration: InputDecoration(
            hintText: 'E.g. Apples, Banana, 1 bag of salt',
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: _currentColor,
              ),
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide(
                color: _currentColor,
              ),
            ),
          ),
        ),
      ],
    );
  }

// TODO: add buildImportanceField()
  Widget buildImportanceField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Importance',
          style: GoogleFonts.lato(
            fontSize: 28,
          ),
        ),
        Wrap(spacing: 10, children: [
          ChoiceChip(
            selectedColor: Colors.black,
            selected: _importance == Importance.low,
            label: const Text(
              'low',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onSelected: (selected) {
              setState(() {
                _importance = Importance.low;
              });
            },
          ),
          ChoiceChip(
            selectedColor: Colors.black,
            selected: _importance == Importance.medium,
            label: const Text(
              'medium',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onSelected: (selected) {
              setState(() {
                _importance = Importance.medium;
              });
            },
          ),
          ChoiceChip(
            selectedColor: Colors.black,
            selected: _importance == Importance.high,
            label: const Text(
              'high',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onSelected: (selected) {
              setState(() {
                _importance = Importance.high;
              });
            },
          ),
        ])
      ],
    );
  }

// TODO: add buildDateField()
  Widget buildDateField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Date',
              style: GoogleFonts.lato(
                fontSize: 28,
              ),
            ),
            TextButton(
              child: Text('Select'),
              onPressed: () async {
                final currentDate = DateTime.now();
                final selectedDate = await showDatePicker(
                  context: context,
                  initialDate: currentDate,
                  firstDate: currentDate,
                  lastDate: DateTime(currentDate.year + 3),
                );
                setState(() {
                  if (selectedDate != null) {
                    _dueDate = selectedDate;
                  }
                });
              },
            ),
          ],
        ),
        Text('${DateFormat('yyyy-MM-dd').format(_dueDate)}'),
      ],
    );
  }

// TODO: add buildTimeField()
  Widget buildTimeField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Time',
              style: GoogleFonts.lato(
                fontSize: 28,
              ),
            ),
            TextButton(
              child: Text('Select'),
              onPressed: () async {
                final currentTime = TimeOfDay.now();
                final selectedTime = await showTimePicker(
                  context: context,
                  initialTime: currentTime,
                );
                setState(() {
                  if (selectedTime != null) {
                    _timeOfDay = selectedTime;
                  }
                });
              },
            ),
          ],
        ),
        Text('${_timeOfDay.format(context)}'),
      ],
    );
  }

// TODO: add buildColorPicker()
  Widget buildColorPicker(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              height: 40,
              width: 8,
              color: _currentColor,
            ),
            const SizedBox(width: 10),
            Text(
              'Color',
              style: GoogleFonts.lato(
                fontSize: 28,
              ),
            ),
          ],
        ),
        TextButton(
          child: const Text('Select'),
          onPressed: () async {
            final selectedColor = await showDialog(
              context: context,
              builder: (context) => AlertDialog(
                content: BlockPicker(
                  pickerColor: _currentColor,
                  onColorChanged: (color) {
                    setState(() {
                      _currentColor = color;
                    });
                  },
                ),
                // unlike date/time picker, there's no OK/Cancel button, so we
                // need to add one action to the dialog for user
                actions: [
                  TextButton(
                    child: const Text('Done'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

// TODO: add buildQuantityField()
  Widget buildQuantityField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              'Quantity',
              style: GoogleFonts.lato(
                fontSize: 28,
              ),
            ),
            const SizedBox(width: 16),
            Text(
              '$_currentSliderValue',
              style: GoogleFonts.lato(
                fontSize: 16,
              ),
            ),
          ],
        ),
        Slider(
          value: _currentSliderValue.toDouble(),
          min: 0,
          max: 100,
          divisions: 100,
          label: '$_currentSliderValue',
          onChanged: (newValue) {
            setState(() {
              _currentSliderValue = newValue.round();
            });
          },
          activeColor: _currentColor,
          inactiveColor: _currentColor.withOpacity(0.3),
        ),
      ],
    );
  }
}
