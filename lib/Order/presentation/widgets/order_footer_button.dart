import 'package:flutter/material.dart';

class OrderFooterButton extends StatelessWidget {
  final VoidCallback onPress;
  final String text;
  final String priceTxt;
  const OrderFooterButton({
    Key? key,
    required this.onPress,
    required this.text,
    required this.priceTxt,
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
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: ElevatedButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text.rich(
                TextSpan(
                  text: priceTxt,
                  children: [
                    TextSpan(
                        text: ' EGP',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                        )),
                  ],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          onPressed: onPress,
        ),
      ),
    );
  }
}
