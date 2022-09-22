import 'package:flutter/material.dart';

import 'category_chip.dart';

class CategoriesBaner extends StatelessWidget {
  const CategoriesBaner({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CategoryChip(
                    selected: true,
                    icon: Icons.restaurant,
                    label: 'Food',
                    onSelect: () {},
                  ),
                  CategoryChip(
                    selected: false,
                    icon: Icons.restaurant,
                    label: 'Food',
                    onSelect: () {},
                  ),
                  CategoryChip(
                    selected: false,
                    icon: Icons.restaurant,
                    label: 'Food',
                    onSelect: () {},
                  ),
                  CategoryChip(
                    selected: false,
                    icon: Icons.restaurant,
                    label: 'Food',
                    onSelect: () {},
                  ),
                ],
              )),
        );
  }
}