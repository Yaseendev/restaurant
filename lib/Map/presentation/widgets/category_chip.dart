import 'package:flutter/material.dart';

class CategoryChip extends StatelessWidget {
  final bool selected;
  final VoidCallback onSelect;
  final IconData icon;
  final String label;
  const CategoryChip({
    Key? key,
    required this.icon,
    required this.label,
    required this.onSelect,
    required this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: ElevatedButton.icon(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
                selected ? Colors.black : Color(0xFFF6F6F6)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ))),
        onPressed: () {},
        icon: Icon(
          icon,
          color: selected ? Colors.white : Colors.black,
        ),
        label: Text(
          label,
          style: TextStyle(color: selected ? Colors.white : Colors.black),
        ),
      ),
    );
    // Card(
    //   child: ListTile(leading: Icon(Icon)),
    // );
  }
}
