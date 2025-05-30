import 'package:chakula_time/widgets/meal_item.dart';
import 'package:flutter/material.dart';
import 'package:chakula_time/models/meal.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen(
    {
      super.key, 
      this.title, 
      required this.meals
    }
  );

  final String? title;

  final List<Meal> meals;

  @override
  Widget build(context) {
    Widget content = ListView.builder(
      itemCount: meals.length,
      itemBuilder: (context, index) {
        return MealItem(meal: meals[index]);
      },
    );

    if (meals.isEmpty) {
      content = Center( 
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Uh oh ... nothing here!',
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      // ignore: deprecated_member_use
                      color: Theme.of(context).colorScheme.onBackground,
                ),
            ),
            SizedBox(height: 16),
            Text('Try selecting a different category!',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      // ignore: deprecated_member_use
                      color: Theme.of(context).colorScheme.onBackground,
                ),
                ),
          ],
          ),
      );
    }

    if(title == null) {
      return content;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title!), 
      ), 
        body: content
    );
  }
}
