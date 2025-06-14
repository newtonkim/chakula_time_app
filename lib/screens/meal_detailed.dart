import 'package:flutter/material.dart';
import 'package:chakula_time/models/meal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:chakula_time/providers/favorites_provider.dart';

class MealDetailedScreen extends ConsumerWidget {
  const MealDetailedScreen(
    {
      super.key, 
      required this.meal,
    }
  );

  final Meal meal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () {
             final wasAdded = ref
              .read(favoriteMealsProvider.notifier)
              .toggleMealFavoriteStatus(meal);
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(wasAdded ?  'Meal added as favorite': 'Meal removed'),
                  ),
                );
              
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
