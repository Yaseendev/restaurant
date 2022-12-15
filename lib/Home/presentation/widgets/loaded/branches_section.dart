import 'package:flutter/material.dart';
import 'package:restaurant_app/Branch/data/Models/branch.dart';

import 'restaurant_card.dart';

class BranchesSection extends StatelessWidget {
  final List<Branch> branches;
  const BranchesSection({
    Key? key,
    required this.branches,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: branches.map((e) => RestaurantCard(
            addressName: e.name ?? '',
            address: e.address ?? '',
          ),).toList(),
        //[
          //ProductCard(),
          //RestaurantCard(
          //  addressName: 'Shebin al-Kom',
          //  address:
         //       'البر الشرقي شارع مصطفي كامل القبلي .أمام محلات ابو شحاط Shebin al-Kom',
         // ),
          // RestaurantCard(
          //   addressName: 'Nasr City',
          //   address: 'شرق مدينة نصر',
          // ),
        //],
      ),
    );
  }
}