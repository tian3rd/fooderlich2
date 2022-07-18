import 'package:flutter/material.dart';

class EmptyGroceryScreen extends StatelessWidget {
  const EmptyGroceryScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO 3: replace and add layout widgets
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          // TODO 4: add empty screen image
          Flexible(
            child: AspectRatio(
              aspectRatio: 3 / 2,
              // remember to update the pubspec.yaml to include the image
              child: Image.asset('assets/fooderlich_assets/empty_list.png'),
            ),
          ),
          // TODO 5: add empty screen title
          Text(
            'No Groceries',
            style: Theme.of(context).textTheme.headline4,
          ),
          // TODO 6: add empty screen subtitle
          SizedBox(height: 16),
          Text(
            'Add groceries to your list to get started!\n'
            'Tap the + button to add a grocery.',
            style: Theme.of(context).textTheme.bodyText2,
            textAlign: TextAlign.center,
          ),
          // TODO 7: add empty screen browse button
          SizedBox(height: 16),
          MaterialButton(onPressed: () {},
            textColor: Colors.white,
            child: Text('Browse Recipes'),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            color: Colors.green,
          ),
        ]),
      ),
    );
  }
}
