import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ProductsTabBarLoading extends StatelessWidget {
  const ProductsTabBarLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, left: 8, right: 8),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        enabled: true,
        child: Row(
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
      ),
    );
  }
}
