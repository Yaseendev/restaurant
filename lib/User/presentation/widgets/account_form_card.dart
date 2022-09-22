import 'package:flutter/material.dart';

class AccountFormCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final num count;
  final String subtitle;
  final Color color;
  const AccountFormCard({
    Key? key,
    required this.count,
    
    required this.icon,
    required this.subtitle,
    required this.title,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: color,
                  child: Icon(
                    icon,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  title,
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text.rich( 
              TextSpan(
                text: '$count ',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  TextSpan(
                      text: subtitle,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
