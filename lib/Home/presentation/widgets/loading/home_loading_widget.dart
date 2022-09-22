import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import '../loaded/restaurant_card.dart';

class HomeLoadingWidget extends StatelessWidget {
  const HomeLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      enabled: true,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
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
            SizedBox(height: 8),
            CarouselSlider(
              options: CarouselOptions(
                viewportFraction: 0.9,
                height: 175,
                aspectRatio: 2.0,
                enlargeCenterPage: false,
                scrollDirection: Axis.horizontal,
                autoPlay: false,
                scrollPhysics: NeverScrollableScrollPhysics(),
              ),
              items: [
                Container(
                  margin: EdgeInsets.all(5.0),
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Color(0xFFF6F6F6),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            Container(
              height: 25,
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
            Row(
              children: [
                RestaurantCard(),
                RestaurantCard(),
              ],
            ),
            SizedBox(height: 8),
            Container(
              height: 25,
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
            Container(
              margin: EdgeInsets.all(5.0),
              height: 30.h,
              width: 200.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Color(0xFFF6F6F6),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
