import 'package:flutter/material.dart';
import 'package:chakula_time/models/meal.dart';
import 'package:chakula_time/screens/meal_detailed.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:chakula_time/widgets/meal_item_trait.dart';

class MealItem extends StatelessWidget {
  const MealItem(
    {
      super.key, 
      required this.meal,
    }
  );

  final Meal meal;

  String get complexityText {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  String get affordabilityText {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }


  void _selectMealDetails(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (ctx) {
        return MealDetailedScreen(
          meal: meal,
        
        );
      }),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          _selectMealDetails(context);
        },
        child: Stack(
          children: [
            FadeInImage(
                placeholder: MemoryImage(kTransparentImage), 
                image: NetworkImage(meal.imageUrl),
                fit: BoxFit.cover,
                height: 200,
                width: double.infinity
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                color: Colors.black54,
                padding: EdgeInsets.symmetric(
                  vertical: 6, 
                  horizontal: 44
                ),
                child: Column(
                 children: [
                    Text(
                      meal.title, maxLines: 2,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MealItemTrait(
                          icon: Icons.schedule,
                          label: '${meal.duration} min',// this converts integer to string
                        ),
                        const SizedBox(width: 12),
                        MealItemTrait(
                          icon: Icons.work,
                          label: complexityText,
                        ),
                        const SizedBox(width: 12),
                        MealItemTrait(
                          icon: Icons.attach_money,
                          label: affordabilityText,
                        )
                      ],
                    ),
                  ],
                ),
            ),
            ),
          ],
        ),
      ),
    ); // Replace with actual widget content
  }
}