import 'package:chakula_time/models/meal.dart';
import 'package:flutter/material.dart';

class MealDetailedScreen extends StatelessWidget {
  const MealDetailedScreen(
    {
      super.key, 
      required this.meal,
      required this.onToggleFavorite
    }
  );

  final Meal meal;
  final void Function(Meal meal) onToggleFavorite;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () {
              onToggleFavorite(meal);
            },
            icon: const Icon(Icons.star),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              meal.imageUrl,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover
            ),
            const SizedBox(height: 14),
            Text('Ingredients', style: Theme.of(context).textTheme.titleLarge!.copyWith(
              // ignore: deprecated_member_use
              color: Theme.of(context).colorScheme.primary,
            ),),
            const SizedBox(height: 14),
            for (final ingredient in meal.ingredients)
              Text(
                ingredient, 
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  // ignore: deprecated_member_use
                  color: Theme.of(context).colorScheme.onBackground,
                ),
            ),
             const SizedBox(height: 24),
            Text('Steps', style: Theme.of(context).textTheme.titleLarge!.copyWith(
              // ignore: deprecated_member_use
              color: Theme.of(context).colorScheme.primary,
            ),),
            const SizedBox(height: 14),
            for (final step in meal.steps)
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12, 
                  vertical: 8
                ),
                child: Text(
                  step, 
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    // ignore: deprecated_member_use
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                ),
              ),
          ]
        ),
      ),

    );
  }
}
