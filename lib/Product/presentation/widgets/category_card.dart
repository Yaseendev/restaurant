import 'package:flutter/material.dart';
import 'package:restaurant_app/Restaurant/presenation/screens/restaurant_screen.dart';

import '../screens/products_screen.dart';

class CategoryCard extends StatelessWidget {
  final String image;
  final String title;
  final int index;
  const CategoryCard({
    required this.image,
    required this.title,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => ProductsScreen(
                  initIndex: index,
                )));
      },
      child: Card(
        elevation: 5.0,
        //color: Theme.of(context).backgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Image.asset(
                image,
                height: 60,
                width: 70,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
