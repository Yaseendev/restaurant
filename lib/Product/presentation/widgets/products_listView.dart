import 'package:flavor/flavor_colors.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/Product/models/product.dart';
import 'package:restaurant_app/Product/models/product_option.dart';
import 'package:restaurant_app/utils/constants.dart';

import 'product_tile.dart';

class ProductsListView extends StatefulWidget {
  final String title; //FIXME: Change
  final List<Product> products;
  final Function(List<num> orders) onProducrOrder;
  const ProductsListView({
    Key? key,
    required this.title,
    required this.products,
    required this.onProducrOrder,
  }) : super(key: key);

  @override
  State<ProductsListView> createState() => _ProductsListViewState();
}

class _ProductsListViewState extends State<ProductsListView> {
  final List<num> orders = []; //FIXME

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: TextStyle(
              color: AppColors.PRIMARY_COLOR,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          ...ListTile.divideTiles(
            context: context,
            tiles: widget.products.map((product) => ProductTile(product: product,)).toList(), 
          ),
        ],
      ),
    );
  }
}
