import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ProductsLoading extends StatelessWidget {
  const ProductsLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      enabled: true,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 40,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      width: 0,
                      color: Color(0xFFF6F6F6),
                      style: BorderStyle.none,
                    ),
                    color: Color(0xFFF6F6F6),
                  ),
                ),
                SizedBox(width: 4),
                Expanded(
                  child: Container(
                    height: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        width: 0,
                        color: Color(0xFFF6F6F6),
                        style: BorderStyle.none,
                      ),
                      color: Color(0xFFF6F6F6),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            ...List.filled(
                3,
                SizedBox(
                  width: double.maxFinite,
                  height: 100,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
