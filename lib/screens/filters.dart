import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:chakula_time/providers/filters_provider.dart';

class FilterScreen extends ConsumerWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
      final activeFilters =  ref.watch(filterProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Filters'),
        ),
        body: Column(
          children: [
            SwitchListTile(
              value: activeFilters[Filter.glutenFree]!,
              onChanged: (isChecked) {
                ref
                    .read(filterProvider.notifier)
                    .setFilter(Filter.glutenFree, isChecked);
              },
              title: Text(
                'Gluten-free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      // ignore: deprecated_member_use
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only includes gluten-free meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      // ignore: deprecated_member_use
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: activeFilters[Filter.lactoseFree]!,
              onChanged: (isChecked) {
                ref
                    .read(filterProvider.notifier)
                    .setFilter(Filter.lactoseFree, isChecked);
              },
              title: Text(
                'Lactose-free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      // ignore: deprecated_member_use
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only includes lactose-free meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      // ignore: deprecated_member_use
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: activeFilters[Filter.vegan]!,
              onChanged: (isChecked) {
                ref
                    .read(filterProvider.notifier)
                    .setFilter(Filter.vegan, isChecked);
              },
              title: Text(
                'Vegan', 
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      // ignore: deprecated_member_use
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only includes vegan meals.', 
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      // ignore: deprecated_member_use
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: activeFilters[Filter.vegetarian]!,
              onChanged: (isChecked) {
                ref
                    .read(filterProvider.notifier)
                    .setFilter(Filter.vegetarian, isChecked);
              },
              title: Text(
                'Vegetarian', 
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      // ignore: deprecated_member_use
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only includes vegetarian meals.', 
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      // ignore: deprecated_member_use
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
          ],
        ),
    );
  }
}