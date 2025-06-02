import 'package:chakula_time/models/meal.dart';
import 'package:chakula_time/screens/categories.dart';
import 'package:chakula_time/screens/filters.dart' show Filter; // Import Filter enum
import 'package:chakula_time/screens/filters.dart'; // Full import for FilterScreen
import 'package:chakula_time/screens/meals.dart';
import 'package:chakula_time/widgets/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:chakula_time/data/dummy_data.dart'; // Import dummyMeals

// Default filter settings
const kInitialFilters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegan: false,
  Filter.vegetarian: false,
};

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _selectedPageIndex = 0;
  final List<Meal> _favoriteMeals = [];
  Map<Filter, bool> _activeFilters = kInitialFilters;

  // Handles navigation from the drawer, especially to the FilterScreen
  void _setScreen(String identifier) async { // Make async to await result from FilterScreen
    Navigator.of(context).pop(); // Close the drawer first
    if (identifier == 'filters') {
      // Navigate to FilterScreen and await the returned map of filters
      final result = await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (ctx) => FilterScreen(currentFilters: _activeFilters),
        ),
      );
      // Update the active filters if result is not null
      setState(() {
        _activeFilters = result ?? _activeFilters; // Use returned filters or keep old ones if null
      });
    }
    // Note: If 'meals' identifier was used to navigate to a general meals list,
    // it's handled by the bottom navigation bar. Drawer only handles 'filters' for now.
  }

  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  // Toggles a meal's favorite status
  void _toggleMealFavoriteStatus(Meal meal) {
    final isExisting = _favoriteMeals.contains(meal);
    if (isExisting) {
      setState(() {
        _favoriteMeals.remove(meal);
        _showInfoMessage('Removed from favorites');
      });
    } else {
      setState(() {
        _favoriteMeals.add(meal);
        _showInfoMessage('Marked as a favorite');
      });
    }
  }

  // Handles bottom navigation tap
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Apply active filters to the dummyMeals list
    final availableMeals = dummyMeals.where((meal) {
      if (_activeFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (_activeFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (_activeFilters[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      if (_activeFilters[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      return true;
    }).toList();

    Widget activePage;
    var activePageTitle = 'Categories';

    if (_selectedPageIndex == 0) {
      activePage = CategoriesScreen(
        onToggleFavorite: _toggleMealFavoriteStatus,
        availableMeals: availableMeals, // Pass filtered meals to CategoriesScreen
      );
      activePageTitle = 'Categories';
    } else {
      // Filter favorite meals based on active filters as well
      final filteredFavoriteMeals = _favoriteMeals.where((meal) {
        if (_activeFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
          return false;
        }
        if (_activeFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
          return false;
        }
        if (_activeFilters[Filter.vegan]! && !meal.isVegan) {
          return false;
        }
        if (_activeFilters[Filter.vegetarian]! && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
      activePage = MealsScreen(
        meals: filteredFavoriteMeals, // Pass filtered favorite meals
        onToggleFavorite: _toggleMealFavoriteStatus,
      );
      activePageTitle = 'Your Favorites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(onSelectScreen: _setScreen),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
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