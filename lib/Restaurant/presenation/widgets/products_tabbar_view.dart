import 'package:flutter/material.dart';
import 'package:restaurant_app/Category/data/models/product_category.dart';
import 'package:restaurant_app/Product/data/models/product.dart';

import 'items_listView.dart';

class ProductsTabBarView extends StatelessWidget {
  final TabController? _tabController;
  final Map<ProductCategory, List<Product>> products;

  const ProductsTabBarView({
    super.key,
    required TabController? tabController,
    required this.products,
  }) : _tabController = tabController;

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: _tabController,
      children: products.entries
          .map((e) => ItemsListView(
                title: e.key.name,
                items: e.value,
                onProductOrder: (order) {},
              ))
          .toList(),
    );
  }
}
