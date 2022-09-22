import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OrderFooterButtons extends StatelessWidget {
  final VoidCallback onStartPress;
  final VoidCallback onBasketPress;
  const OrderFooterButtons({
    Key? key,
    required this.onStartPress,
    required this.onBasketPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 35,
      type: MaterialType.card,
      borderOnForeground: true,
      shadowColor: Colors.black,
      child: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                child: Text(
                  'Start Ordering',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: onStartPress,
              ),
            ),
            SizedBox(width: 6),
            ElevatedButton(
              child: Icon(FontAwesomeIcons.basketShopping),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              onPressed: onBasketPress,
            ),
          ],
        ),
      ),
    );
  }
}