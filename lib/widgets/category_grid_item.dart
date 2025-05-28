
import 'package:flutter/material.dart';
import 'package:chakula_time/models/category.dart';


class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({
    super.key,
    required this.category,
    required this.onSelectCategory,
  });

  final Category category;
  final void Function(BuildContext context, Category category) onSelectCategory;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onSelectCategory(context, category);
      },
      
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),

      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
               // ignore: deprecated_member_use
              category.color.withOpacity(0.55),
               // ignore: deprecated_member_use
              category.color.withOpacity(0.9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),  
          ),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            // ignore: deprecated_member_use
            color: Theme.of(context).colorScheme.onBackground,
          ),
        ),  
      ),
    );
  // Placeholder
  }
} 