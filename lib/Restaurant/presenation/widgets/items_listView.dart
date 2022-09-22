import 'package:flavor/flavor_colors.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/utils/constants.dart';
import 'item_tile.dart';

class ItemsListView extends StatelessWidget {
  final String title;
  const ItemsListView({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: AppColors.PRIMARY_COLOR,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          ...ListTile.divideTiles(
            context: context,
            tiles: [
              ItemTile(),
              ItemTile(),
              ItemTile(),
              ItemTile(),
              ItemTile(),
              ItemTile(),
              ItemTile(),
              ItemTile(),
            ],
          ),
        ],
      ),
    );
  }
}
