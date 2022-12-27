import 'package:flutter/material.dart';
import 'package:restaurant_app/Branch/data/Models/branch.dart';

import 'brach_tile.dart';

class BranchesListView extends StatelessWidget {
  final List<Branch> branches;
  const BranchesListView({
    Key? key,
    required this.branches,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: branches.map((branch) => BrachTile(
        title: branch.name ?? '',
         details: branch.address ?? '',
      ),).toList(), 
    );
  }
}
