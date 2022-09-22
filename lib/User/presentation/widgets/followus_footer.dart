import 'package:flutter/material.dart';


class FollowUsFooter extends StatelessWidget {
  const FollowUsFooter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            'Follow Us',
            style: TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
    SizedBox(height: 15),
    Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/images/fbLogo.png'),
        SizedBox(width: 15),
        Image.asset('assets/images/instaLogo.png'),
        SizedBox(width: 15),
        Image.asset('assets/images/twLogo.png'),
        SizedBox(width: 15),
        Image.asset('assets/images/snapLogo.png'),
      ],
    ),
      ],
    );
  }
}