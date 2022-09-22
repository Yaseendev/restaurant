import 'package:flutter/material.dart';

import 'brach_tile.dart';

class BranchesListView extends StatelessWidget {
  const BranchesListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BrachTile(),
        BrachTile(),
        BrachTile(),
        BrachTile(),
      ],
    );
  }
}
