import 'package:flutter/material.dart';
import 'package:chakula_time/models/meal.dart';
import 'package:chakula_time/screens/meals.dart';
import 'package:chakula_time/screens/filters.dart';
import 'package:chakula_time/screens/categories.dart';
import 'package:chakula_time/widgets/main_drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:chakula_time/providers/meals_provider.dart';
import 'package:chakula_time/providers/favorites_provider.dart';
import 'package:chakula_time/providers/filters_provider.dart';


// Default filter settings (kInitialFilters removed as filters are now managed by filterProvider)

class TabScreen extends ConsumerStatefulWidget {
  const TabScreen({super.key});

  @override
  ConsumerState<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends ConsumerState<TabScreen> {
  int _selectedPageIndex = 0;
  // Map<Filter, bool> _activeFilters = kInitialFilters; // Removed: Filters now read from filterProvider

  // Handles navigation from the drawer, especially to the FilterScreen
  void _setScreen(String identifier) {
    Navigator.of(context).pop(); // Close the drawer first
    if (identifier == 'filters') {
      // Navigate to FilterScreen. It will manage its state via filterProvider.
      Navigator.of(context).push<Map<Filter, bool>>( // Return type <Map<Filter, bool>> might no longer be relevant
        MaterialPageRoute(
          builder: (ctx) => const FilterScreen(), // Removed currentFilters
        ),
      );
      // setState for _activeFilters is no longer needed here as FilterScreen updates the provider directly.
      // The TabScreen will rebuild if it's watching the filterProvider and it changes.
    }
   
  }

  // Handles bottom navigation tap
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  // Helper method to filter meals
  List<Meal> _filterMeals(List<Meal> meals, Map<Filter, bool> activeFilters) {
    return meals.where((meal) {
      if (activeFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (activeFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (activeFilters[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      if (activeFilters[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      return true;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final allMeals = ref.watch(mealsProvider);
    final activeFilters = ref.watch(filterProvider); // Watch the filters
    final availableMeals = _filterMeals(allMeals, activeFilters);

    Widget activePage;
    var activePageTitle = 'Categories';

    if (_selectedPageIndex == 0) {
      activePage = CategoriesScreen(
       
        availableMeals: availableMeals, // Pass filtered meals to CategoriesScreen
      );
      activePageTitle = 'Categories';
    } else {
      final favoriteMeals =  ref.watch(favoriteMealsProvider);
      // final filteredFavoriteMeals = _filterMeals(_favoriteMeals);
      activePage = MealsScreen(
        meals: favoriteMeals, // Pass filtered favorite meals
      
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