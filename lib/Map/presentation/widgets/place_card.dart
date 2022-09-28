import 'package:flavor/flavor_assets.dart';
import 'package:flavor/flavor_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:restaurant_app/utils/constants.dart';

class PlaceCard extends StatelessWidget {
  const PlaceCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 266, 
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: AssetImage(AppImages.APPLOGO),
              ),
              title: Text(
               'Pizza Master',
               //'Zad',
               //'Abo Saleh'
               // 'HeatAttack'
                //'Tata\s Sons'
                //'Burger King'
                ),
              subtitle: Text(
               //'Hyper Market',
                'Fast Food',
                style: TextStyle(color: AppColors.PRIMARY_COLOR),
              ),
              trailing: Padding(
                padding: const EdgeInsets.only(top: 25),
                child: RatingBar.builder(
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (value) {},
                  ignoreGestures: true,
                  itemSize: 12,
                  initialRating: 3.5,
                  allowHalfRating: true,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Chip(
                label: Text.rich(TextSpan(
                  text: '1.4 KM ',
                  children: [
                    TextSpan(
                      text: 'from your location',
                      style: TextStyle(color: Color(0xFF00A2D7)),
                    ),
                  ],
                )),
                padding: const EdgeInsets.all(8),
                backgroundColor: const Color(0xFFE6F4F9),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
