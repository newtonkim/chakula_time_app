import 'package:chakula_time/screens/categories.dart';
import 'package:chakula_time/screens/meals.dart';
import 'package:flutter/material.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {

    Widget activePage = CategoriesScreen();
    var activePageTitle = 'Categories';

    if (_selectedPageIndex == 1) {
      activePage = const MealsScreen(meals: []);
      activePageTitle = 'Your Favorites';
    }
    return Scaffold(
      appBar: AppBar(
        title:  Text(activePageTitle),
      ),
      body: activePage,

      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex, // this controlls which tab will be highlighted
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}