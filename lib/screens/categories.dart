import 'package:chakula_time/models/meal.dart';
import 'package:flutter/material.dart';
import 'package:chakula_time/screens/meals.dart';
import 'package:chakula_time/models/category.dart';
import 'package:chakula_time/data/dummy_data.dart';
import 'package:chakula_time/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({
    super.key,
  
    required this.availableMeals, // Add availableMeals to constructor
  });

 
  final List<Meal> availableMeals; // Declare availableMeals field

  void _selectCategory(BuildContext context, Category category) {
    // Filter meals for the selected category AND ensure they are in availableMeals
    final categoryMeals = availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(builder: (ctx) {
        return MealsScreen(
            meals: categoryMeals, // Pass the doubly filtered list
            title: category.title,
        );
           
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        padding: const EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20),
        children: [
          // ignore: avoid_redundant_argument_values
          for (final category in availableCategories)
            CategoryGridItem(
                category: category, onSelectCategory: _selectCategory),
        ],
      ),
    );
  }
}