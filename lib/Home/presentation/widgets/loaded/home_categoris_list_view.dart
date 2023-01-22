import 'package:flutter/material.dart';
import 'package:restaurant_app/Category/data/models/product_category.dart';
import 'package:restaurant_app/Product/presentation/widgets/category_card.dart';

class CategoriesListView extends StatelessWidget {
  final List<ProductCategory> categories;
  const CategoriesListView({
    Key? key,
    required this.categories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(categories.length ,(index) => CategoryCard(
          image: categories[index].imageUrl,
          title: categories[index].name,
          index: index,
        )),
      ),
    );
  }
}
