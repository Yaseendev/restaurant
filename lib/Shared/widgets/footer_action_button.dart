import 'package:flutter/material.dart';

class FooterActionButton extends StatelessWidget {
  final VoidCallback onPress;
  final String text;
  const FooterActionButton({Key? key, required this.onPress,
  required this.text,
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
        child: ElevatedButton(
          child: Text(
            text,
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
          onPressed: onPress,
        ),
      ),
    );
  }
}
