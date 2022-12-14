import 'package:flutter/material.dart';

import 'rate_row.dart';

class RestaurantRating extends StatefulWidget {
  final Function(double service, double staff, double palce) onRateUpdate;
  const RestaurantRating({
    Key? key,
    required this.onRateUpdate,
  }) : super(key: key);

  @override
  State<RestaurantRating> createState() => _RestaurantRatingState();
}

class _RestaurantRatingState extends State<RestaurantRating> {
  double serviceRate = 0;
  double staffRate = 0;
  double palceRate = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RateRow(
          label: 'Service',
          onRate: (rating) {
            serviceRate = rating;
            widget.onRateUpdate(rating, staffRate, palceRate);
          },
        ),
        SizedBox(height: 28),
        RateRow(
          label: 'Staff',
          onRate: (rating) {
            staffRate = rating;
            widget.onRateUpdate(serviceRate, rating, palceRate);
          },
        ),
        SizedBox(height: 28),
        RateRow(
          label: 'Place',
          onRate: (rating) {
            palceRate = rating;
            widget.onRateUpdate(serviceRate, staffRate, rating);
          },
        ),
      ],
    );
  }
}
