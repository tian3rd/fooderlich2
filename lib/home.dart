import 'package:flutter/material.dart';
import 'card1.dart';
import 'card2.dart';
import 'card3.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // TODO: add state variables and functions
  int _selectedIndex = 0;

  static List<Widget> pages = <Widget> [
    // TODO: replace with card1
    const Card1(),
    // TODO: replace with card2
    const Card2(),
    // TODO: replace with card3
    // Container(color: Colors.blue),
    const Card3(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fooderlich App',
          style: Theme.of(context).textTheme.headline6,),
      ),
      // TODO: show selected tab
      body: pages[_selectedIndex],
      // TODO: add bottom navigation bar
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).textSelectionTheme.selectionColor,
        // TODO: set selected tab bar
        currentIndex: _selectedIndex,
        onTap: _onItemTapped, // how does it pass in the index?
        items: <BottomNavigationBarItem> [
          const BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard),
            label: 'Card',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard),
            label: 'Card2',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard),
            label: 'Card3',
          ),
        ],
      ),
    );
  }
}