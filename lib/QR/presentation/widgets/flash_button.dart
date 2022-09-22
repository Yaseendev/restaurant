import 'package:flutter/material.dart';

class FlashButton extends StatelessWidget {
  final bool isFlashOn;
  final VoidCallback onToggle;
  const FlashButton({
    Key? key,
    required this.isFlashOn,
    required this.onToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(10),
        shape: MaterialStateProperty.all(
          CircleBorder(),
        ),
        backgroundColor: MaterialStateProperty.all(Colors.white),
      ),
      onPressed: onToggle,
      child: Icon(
        isFlashOn ? Icons.flash_on : Icons.flash_off,
        size: 30,
        color: isFlashOn
            ? Colors.amber
            : Theme.of(context).textTheme.bodyText1!.color,
      ),
    );
  }
}
