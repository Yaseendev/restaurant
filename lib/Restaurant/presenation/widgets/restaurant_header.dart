import 'package:flavor/flavor_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:restaurant_app/Branch/data/Models/branch.dart';
import 'package:restaurant_app/utils/constants.dart';

import '../screens/rate_screen.dart';

class RestaurantHeader extends StatelessWidget {
  final List<Branch> branches;
  const RestaurantHeader({
    Key? key,
    required this.branches,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            ' $appName',
            //' Gad Restaurant',
            //' Pizza Master',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              Icon(
                Icons.location_pin,
                color: AppColors.PRIMARY_COLOR,
              ),
              Text('${branches[0].name ?? ''}. '),
              if (branches.length > 1)
                Chip(
                  label: Text.rich(TextSpan(
                    text: 'and ',
                    children: [
                      TextSpan(
                          text: '${branches.length - 1}',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: ' more'),
                    ],
                  )),
                  labelStyle: TextStyle(color: Colors.white),
                  backgroundColor: AppColors.PRIMARY_COLOR,
                ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                //' Hyper Market',
                ' $shopType',
                style: TextStyle(color: AppColors.PRIMARY_COLOR),
              ),
              TextButton(
                child: Text(
                  '(178) Rate',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                    return RateScreen();
                  }));
                },
              ),

              // Row(
              //   children: [
              //     RatingBar.builder(
              //       itemBuilder: (context, _) => Icon(
              //         Icons.star,
              //         color: Colors.amber,
              //       ),
              //       onRatingUpdate: (value) {},
              //       ignoreGestures: true,
              //       itemSize: 14,
              //       initialRating: 5,
              //       allowHalfRating: true,
              //     ),
              //     SizedBox(width: 10),

              //   ],
              // ),
              
            ],
          ),
        ],
      ),
    );
  }
}
