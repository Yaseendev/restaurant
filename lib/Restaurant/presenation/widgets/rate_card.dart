import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RateCard extends StatelessWidget {
  const RateCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFFF6F6F6),
      margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/images/burger.png'),
              backgroundColor: Colors.white,
              radius: 30,
            ),
            title: Text(
              'Someone Someone',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text('01/12/2021'),
            trailing: RatingBar.builder(
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (value) {},
              ignoreGestures: true,
              itemSize: 15,
              initialRating: 4,
              allowHalfRating: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 30,
              right: 10,
              bottom: 32,
              top: 16,
            ),
            child: Text(
                'A very excellent restaurant, the food provided is of high quality, the staff at the highest level'),
          ),
        ],
      ),
    );
  }
}
