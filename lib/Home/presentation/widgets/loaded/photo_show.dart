import 'package:carousel_slider/carousel_slider.dart';
import 'package:flavor/flavor_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PhotoShow extends StatelessWidget {
  const PhotoShow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        Container(
          margin: EdgeInsets.all(5.0),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: Image.asset(
              AppImages.PHOTO_SHOW1,
              fit: BoxFit.fill,
              width: double.maxFinite,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.all(5.0),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: Image.asset(
              AppImages.PHOTO_SHOW2,
              fit: BoxFit.fill,
              width: double.maxFinite,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.all(5.0),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: Image.asset(
              AppImages.PHOTO_SHOW3,
              fit: BoxFit.fill,
              width: double.maxFinite,
            ),
          ),
        ), 
        Container(
          margin: EdgeInsets.all(5.0),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: Image.asset(
              AppImages.PHOTO_SHOW4,
              fit: BoxFit.fill,
              width: double.maxFinite,
            ),
          ),
        ),
      ],
      options: CarouselOptions(
        viewportFraction: 0.75,
        height: ScreenUtil().orientation == Orientation.portrait ? 40.h : 80.w,
        aspectRatio: 2.5,
        enlargeCenterPage: false,
        scrollDirection: Axis.horizontal,
        autoPlay: true,
      ),
    );
  }
}
