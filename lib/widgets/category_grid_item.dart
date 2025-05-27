
import 'package:flutter/material.dart';
import 'package:chakula_time/models/category.dart';


class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({super.key, required this.category});

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  // Placeholder
  }
} 