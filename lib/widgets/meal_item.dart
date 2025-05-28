import 'package:chakula_time/models/meal.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem(
    {
      super.key, 
      required this.meal
    }
  );

final Meal meal;
  @override
  Widget build(BuildContext context) {
    return  Card(
      child: InkWell(
        onTap: () {},
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
                    SizedBox(height: 10),
                    Row(
                      children: [

                      ],
                    )
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