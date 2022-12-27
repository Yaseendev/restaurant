import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ProductsTabViewLoading extends StatelessWidget {
  const ProductsTabViewLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      enabled: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.filled(
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
      ),
    );
  }
}
