import 'package:flutter/material.dart';

class PreviousOrderCard extends StatelessWidget {
  const PreviousOrderCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 20, left: 14, right: 14),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 1.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            dense: true,
            leading: Text(
              'X1',
              textAlign: TextAlign.right,
              style: TextStyle(fontSize: 18),
            ),
            horizontalTitleGap: 2,
            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
            title: Text(
              'Beef Burger',
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 18),
            ),
          ),
          ListTile(
            dense: true,
            leading: Text(
              'X2',
              textAlign: TextAlign.right,
              style: TextStyle(fontSize: 18),
            ),
            horizontalTitleGap: 2,
            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
            title: Text(
              'Cheese Burger',
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.refresh),
                  label: Text(
                    'Re-order',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Text.rich(TextSpan(
                  text: '240',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: ' EGP',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
