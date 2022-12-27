import 'package:flavor/flavor_assets.dart';
import 'package:flavor/flavor_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:restaurant_app/Branch/data/Models/branch.dart';
import 'package:restaurant_app/utils/constants.dart';

class PlaceCard extends StatelessWidget {
  final VoidCallback onPress;
  final Branch branch;
  const PlaceCard({
    Key? key,
    required this.branch,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: SizedBox(
        width: 270,
        height: 150,
        child: Card(
          color: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage(AppImages.APPLOGO),
                ),
                title: Text(
                  branch.name ?? '',
                  //appName,
                  //'Exception'
                  // 'Gad Restaurant',
                  //'Zad',
                  //'Abo Saleh'
                  // 'HeatAttack'
                  //'Tata\s Sons'
                  //'Burger King'
                ),
                subtitle: Text(
                  //'Hyper Market',
                  branch.address ?? '',
                  style: TextStyle(color: AppColors.PRIMARY_COLOR),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
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
                  label: Text.rich(TextSpan(
                    text: '1.4 KM ',
                    children: [
                      TextSpan(
                        text: 'from your location',
                        style: TextStyle(color: Color(0xFF00A2D7)),
                      ),
                    ],
                  )),
                  //padding: const EdgeInsets.all(8),
                  backgroundColor: const Color(0xFFE6F4F9),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
