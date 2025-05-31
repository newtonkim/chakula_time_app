import 'package:chakula_time/models/meal.dart';
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
  final List<Meal> favoriteMeals = [];


  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

    // add or remove a meal from the favorites list
  void _toggleMealFavoriteStatus(Meal meal) {
      final isExisting = favoriteMeals.contains(meal);
      if (isExisting) {
        setState(() {
          favoriteMeals.remove(meal);
          _showInfoMessage('Removed from favorites');
        });
       
      } else {
        setState(() {
          favoriteMeals.add(meal);
          _showInfoMessage('Marked as a favorite');
        });
     
        
      }
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    Widget activePage = CategoriesScreen(onToggleFavorite: _toggleMealFavoriteStatus);
    var activePageTitle = 'Categories';

    if (_selectedPageIndex == 1) {
      activePage = MealsScreen(
        meals: favoriteMeals, 
        onToggleFavorite: _toggleMealFavoriteStatus
      );
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