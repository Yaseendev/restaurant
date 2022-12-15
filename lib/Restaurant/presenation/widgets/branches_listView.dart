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
          title: 'Shebin al-Kom',
          details:
              'البر الشرقي شارع مصطفي كامل القبلي .أمام محلات ابو شحاط Shebin al-Kom',
        ),
        // BrachTile(
        //   title: 'الرحاب',
        //   details: 'الرحاب امام بوابه 24',
        // ),
        // BrachTile(
        //   title: 'مدينة نصر ',
        //   details: 'تقاطع شارع الطاقة مع شارع أكاديمية علوم الرياضةأمام شل اوت',
        // ),
      ],
    );
  }
}
