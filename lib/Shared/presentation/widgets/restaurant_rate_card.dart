import 'package:flavor/flavor_assets.dart';
import 'package:flavor/flavor_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:restaurant_app/utils/constants.dart';

class RestaurantRateCard extends StatelessWidget {
  final bool withRating;
  const RestaurantRateCard({
    Key? key,
    this.withRating = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      color: Color(0xFFF0F9FD),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: .3,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18),
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(AppImages.APPLOGO),
            backgroundColor: Colors.white,
            radius: 35,
          ),
          title: Text(
            appName,
            //'Gad Restaurant',
            // 'Pizza Master',
            //'Zad',
            //'Abo Saleh',
            //'HeatAttack',
            //'Tata\s Sons',
            // 'Burger King',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            //'Hyper Market',
            'Fast Food',
            style: TextStyle(color: AppColors.PRIMARY_COLOR),
          ),
          trailing: withRating
              ? RatingBar.builder(
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (value) {},
                  ignoreGestures: true,
                  itemSize: 13,
                  initialRating: 3,
                )
              : SizedBox(),
        ),
      ),
    );
  }
}
