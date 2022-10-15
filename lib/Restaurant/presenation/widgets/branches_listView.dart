import 'package:flutter/material.dart';

import 'brach_tile.dart';

class BranchesListView extends StatelessWidget {
  const BranchesListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BrachTile(
          title: 'جاد - الحجاز - مصر الجديدة',
          details: '63ش فريد سميكة - ميدان الحجاز , مصر الجديدة',
        ),
        BrachTile(
          title: 'جاد - الدقى',
          details: '97ش التحرير , الدقى',
        ),
        BrachTile(
         title: 'جاد - السقالة - الغردقة',
         details: 'ش الشيراتون , سقالة , الغردقة', 
        ),
        BrachTile(
          title: 'جاد - السوق التجارى القديم - شرم الشيخ',
          details: 'السوق التجارى القديم , شرم الشيخ',
        ),
      ],
    );
  }
}
