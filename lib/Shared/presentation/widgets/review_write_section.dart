import 'package:flutter/material.dart';

class ReviewWriteSection extends StatelessWidget {
  final Function(String notes) onWrite;
  const ReviewWriteSection({Key? key,
  required this.onWrite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              Icons.rate_review_rounded,
              size: 28,
            ),
            SizedBox(width: 8),
            Text(
              'Write Your Review',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        TextField(
          autofocus: false,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
            hintText: 'Write Here',
          ),
          textInputAction: TextInputAction.newline,
          keyboardType: TextInputType.multiline,
          maxLines: 5,
          onChanged: onWrite,
        ),
      ],
    );
  }
}
