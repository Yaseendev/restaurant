import 'package:flutter/material.dart';
import 'package:restaurant_app/Branch/data/Models/branch.dart';
import 'restaurant_card.dart';

class BranchesSection extends StatelessWidget {
  final List<Branch> branches;
  final Function(int branchid) onSelect;
  const BranchesSection({
    Key? key,
    required this.branches,
    required this.onSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          branches.length,
          (index) => GestureDetector(
            onTap: () {
              onSelect(index);
            },
            child: RestaurantCard(
              branch: branches[index],
            ),
          ),
        ).toList(),
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
