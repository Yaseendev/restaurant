import 'package:flavor/flavor_assets.dart';
import 'package:flavor/flavor_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:restaurant_app/utils/constants.dart';

class OffercardLarge extends StatelessWidget {
  const OffercardLarge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
          border: Border.all(
            width: 0.5,
          ),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      //width: 266,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              child: Image.asset(
                AppImages.OFFER,
                height: 130,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
            ),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(AppImages.APPLOGO),
            ),
            title: Text(
              'Zad',
              //'Abo Saleh'
              //'HeatAttack',
              //'Tata\s Sons'
              //'Burger King'
            ),
            subtitle: Text(
              'Fast Food',
              style: TextStyle(color: AppColors.PRIMARY_COLOR),
            ),
            trailing: RatingBar.builder(
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
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, bottom: 0),
            child: Chip(
              label: Text('15% off  for selected items'),
              padding: EdgeInsets.all(8),
              backgroundColor: Color(0xFFE6F4F9),
              labelStyle: TextStyle(color: Color(0xFF00A2D7)),
            ),
          )
        ],
      ),
    );
  }
}
