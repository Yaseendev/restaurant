import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RateRow extends StatelessWidget {
  final String label;
  final Function(double rating) onRate;
  const RateRow({
    Key? key,
    required this.label,
    required this.onRate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        RatingBar.builder(
          itemBuilder: (context, _) => Icon(
            Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (value) {
            print(value);
          },
          itemSize: 26,
          allowHalfRating: true,
        ),
      ],
    );
  }
}
