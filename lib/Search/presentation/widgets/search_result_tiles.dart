import 'package:flutter/material.dart';
import 'package:restaurant_app/Product/data/models/product.dart';
import 'result_tile.dart';

class SearchResultTiles extends StatelessWidget {
  const SearchResultTiles({
    Key? key,
    required this.result,
  }) : super(key: key);

  final List<Product> result;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: ListTile.divideTiles(
          context: context,
          tiles: result.map((product) => ResultTile(product))).toList(),
    );
  }
}
