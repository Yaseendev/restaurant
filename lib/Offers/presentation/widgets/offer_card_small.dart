import 'package:flutter/material.dart';
import 'package:flavor/flavor_assets.dart';

class OfferCardSmall extends StatelessWidget {
  const OfferCardSmall({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
          border: Border.all(
            width: 0.5,
          ),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      width: 266,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              child: Image.asset(
                AppImages.OFFER,
                height: 100,
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
              'Super Offer',
              // 'Zad'
              //'Abo Saleh'
              //'HeatAttack'
            ),
            // subtitle: Text(
            //   //'Hyper Market',
            //   //'Pastry & Bakery',
            //   'Fast Food',
            //   style: TextStyle(color: AppColors.PRIMARY_COLOR),
            // ),
            // trailing: Padding(
            //   padding: const EdgeInsets.only(top: 25),
            //   child: RatingBar.builder(
            //     itemBuilder: (context, _) => Icon(
            //       Icons.star,
            //       color: Colors.amber,
            //     ),
            //     onRatingUpdate: (value) {},
            //     ignoreGestures: true,
            //     itemSize: 12,
            //     initialRating: 3.5,
            //     allowHalfRating: true,
            //   ),
            // ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Chip(
              label: Text('15% off  for selected items'),
              padding: const EdgeInsets.all(8),
              backgroundColor: const Color(0xFFE6F4F9),
              labelStyle: TextStyle(color: Color(0xFF00A2D7)),
            ),
          ),
        ],
      ),
    );
  }
}
