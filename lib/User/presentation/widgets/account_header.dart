import 'package:flavor/flavor_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountHeader extends StatelessWidget {
  final String? photoUrl;
  const AccountHeader({
    Key? key,
    this.photoUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .21,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Image.asset(
            'assets/images/login_bkg.png',
            fit: BoxFit.fill,
            height: MediaQuery.of(context).size.height * .15,
            width: MediaQuery.of(context).size.width,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: photoUrl != null
                ? CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 38.sp,
                    backgroundImage: NetworkImage(photoUrl!),
                  )
                : CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 38.sp,
                    backgroundImage: AssetImage(AppImages.APPLOGO),
                  ),
          ),
        ],
      ),
    );
  }
}
