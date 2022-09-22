import 'package:flutter/material.dart';

import 'stat_card.dart';

class RestaurantStatsWidget extends StatelessWidget {
  const RestaurantStatsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        StatCard(
          precentage: 60,
          color: Colors.deepOrange,
          lable: 'Service',
        ),
        StatCard(
          precentage: 75,
          color: Colors.lightGreen,
          lable: 'Staff',
        ),
        StatCard(
          precentage: 90,
          color: Colors.lightBlue,
          lable: 'Place',
        ),
      ],
    );
  }
}
