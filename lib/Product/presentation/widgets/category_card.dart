import 'package:flutter/material.dart';
import 'package:restaurant_app/Restaurant/presenation/screens/restaurant_screen.dart';

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
      onTap: (){
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => RestaurantScreen(initIndex: index,)));
      },
      child: Column(
        children: [
          Card(
            elevation: 5.0,
            //color: Theme.of(context).backgroundColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Image.asset(
                    image,
                    height: 60,
                    width: 60,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
          ),
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
