import 'package:flavor/flavor_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:restaurant_app/Restaurant/presenation/screens/restaurant_screen.dart';

class RestaurantCard extends StatelessWidget {
  const RestaurantCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => RestaurantScreen()));
      },
      child: Card(
        color: Color(0xFFF0F9FD),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    AppImages.RESTAURANT_HOME_CARD_PIC,
                    alignment: Alignment.center,
                    height: 96,
                    width: 96,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Text(
            'Pizza Master',
            // 'Zad',
             //'Abo Saleh',
             // 'HeatAttack',
              // 'TATA',
              //'KFC',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Column(
              children: [
                Text(
                  //'Hyper Market',
                  'Fast Food',
                  style: TextStyle(
                    fontSize: 12,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                RatingBar.builder(
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (value) {},
                  ignoreGestures: true,
                  itemSize: 12,
                  initialRating: 3,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
