import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick your Cateogry'),
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3/2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20
        ), 
        children: [
          Container(
            color: Colors.lightBlue,
          ),
          Container(
            color: Colors.lightGreen,
          ),
          Container(
            color: Colors.pink,
          ),
          Container(
            color: Colors.orange,
          ),
        ],
      ),

    );
  }
}