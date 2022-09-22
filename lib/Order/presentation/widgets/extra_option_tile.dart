import 'package:flutter/material.dart';

class ExtraOptionTile extends StatefulWidget {
  final Function(bool selected) onUpdate;
  final num price;
  final String optionName;
  const ExtraOptionTile({
    Key? key,
    required this.optionName,
    required this.price,
    required this.onUpdate,
  }) : super(key: key);

  @override
  State<ExtraOptionTile> createState() => _ExtraOptionTileState();
}

class _ExtraOptionTileState extends State<ExtraOptionTile> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      dense: true,
      value: isSelected,
      onChanged: (v) {
        setState(() {
          isSelected = v ?? false;
        });
        widget.onUpdate(isSelected);
      },
      title: Text.rich(
        TextSpan(
          text: '+${widget.price} ',
          children: [
            TextSpan(
                text: 'EGP',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                )),
          ],
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.grey,
          ),
        ),
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.end,
      ),
      contentPadding: EdgeInsets.zero,
      secondary: Text(
        widget.optionName,
        style: TextStyle(
          fontSize: 18,
        ),
      ),
    );
  }
}
