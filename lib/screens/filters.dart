import 'package:flutter/material.dart';

// Enum to represent the different filters for better type safety and readability
enum Filter {
  glutenFree,
  lactoseFree,
  vegan,
  vegetarian,
}

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key, required this.currentFilters});

  // Stores the filter values that were active when this screen was opened.
  final Map<Filter, bool> currentFilters;

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenFreeFilter = false;
  var _lactoseFreeFilter = false;
  var _veganFreeFilter = false;
  var _vegetarianFreeFilter = false;

  @override
  void initState() {
    super.initState();
    // Initialize filter states from the currentFilters passed to the widget
    _glutenFreeFilter = widget.currentFilters[Filter.glutenFree] ?? false;
    _lactoseFreeFilter = widget.currentFilters[Filter.lactoseFree] ?? false;
    _veganFreeFilter = widget.currentFilters[Filter.vegan] ?? false;
    _vegetarianFreeFilter = widget.currentFilters[Filter.vegetarian] ?? false;
  }

  @override
  Widget build(BuildContext context) {
    // PopScope is used to handle back navigation and return selected filter data.
    // canPop is set to false to intercept the pop event.
    // onPopInvoked is called when a pop is attempted. If didPop is false (meaning
    // the pop was intercepted), we manually pop the navigator and pass back the
    // current filter states.
    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) {
        if (didPop) {
          // This condition is true if the pop event was not intercepted and completed.
          // For example, if canPop were true or if Navigator.pop was called elsewhere.
          // In our case with canPop: false, this block is unlikely to be hit unless
          // there's another pop mechanism at play that bypasses this PopScope's control.
          return;
        }
        // A pop attempt was made (e.g., user pressed the back button).
        // We now explicitly pop the current route and pass the filter data as a result.
        Navigator.of(context).pop({
          Filter.glutenFree: _glutenFreeFilter,
          Filter.lactoseFree: _lactoseFreeFilter,
          Filter.vegan: _veganFreeFilter,
          Filter.vegetarian: _vegetarianFreeFilter,
        });
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Your Filters'),
        ),
        body: Column(
          children: [
            SwitchListTile(
              value: _glutenFreeFilter,
              onChanged: (isChecked) {
                setState(() {
                  _glutenFreeFilter = isChecked;
                });
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
              value: _lactoseFreeFilter,
              onChanged: (isChecked) {
                setState(() {
                  _lactoseFreeFilter = isChecked;
                });
              },
              title: Text(
                'Lactose-free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      // ignore: deprecated_member_use
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only includes Lactose-free meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      // ignore: deprecated_member_use
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _veganFreeFilter,
              onChanged: (isChecked) {
                setState(() {
                  _veganFreeFilter = isChecked;
                });
              },
              title: Text(
                'Vegan-free', // Note: "Vegan-free" usually means "contains no vegan ingredients". If the intent is "is Vegan", the label should be "Vegan".
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      // ignore: deprecated_member_use
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only includes vegan-free meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      // ignore: deprecated_member_use
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _vegetarianFreeFilter,
              onChanged: (isChecked) {
                setState(() {
                  _vegetarianFreeFilter = isChecked;
                });
              },
              title: Text(
                'Vegetarian-free', // Note: Similar to "Vegan-free", this label might be confusing.
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      // ignore: deprecated_member_use
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only includes Vegetarian-free meals.',
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
      ),
    );
  }
}