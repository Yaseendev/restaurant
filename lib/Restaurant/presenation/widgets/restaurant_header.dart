import 'package:flavor/flavor_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:restaurant_app/utils/constants.dart';

import '../screens/rate_screen.dart';

class RestaurantHeader extends StatelessWidget {
  const RestaurantHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            ' Gad Restaurant',
            //' Pizza Master',
            //' Zad',
            //' Abo Saleh',
            //' HeatAttack',
            //' Tata\s Sons',
            //' Burger King',
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
              Text('Intersection of Elgeish St. '),
              Chip(
                label: Text.rich(TextSpan(
                  text: 'and ',
                  children: [
                    TextSpan(
                        text: '12',
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
                ' Fast Food',
                style: TextStyle(color: AppColors.PRIMARY_COLOR),
              ),
              Row(
                children: [
                  RatingBar.builder(
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (value) {},
                    ignoreGestures: true,
                    itemSize: 14,
                    initialRating: 4,
                    allowHalfRating: true,
                  ),
                  SizedBox(width: 10),
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
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (ctx) {
                        return RateScreen();
                      }));
                    },
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
