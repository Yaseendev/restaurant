import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_app/utils/constants.dart';

class NoConnectionWidget extends StatelessWidget {
  const NoConnectionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * .15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Image.asset(
                Images.NOCONN,
                width: 160.sp,
                height: 160.sp,
                fit: BoxFit.fill,
              ),
            ),
          ),
          const Text(
            'You are not connected\nPlease connect to a network and try again',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}