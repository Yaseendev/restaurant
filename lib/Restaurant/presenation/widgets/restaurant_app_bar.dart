import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../screens/restaurant_info_screen.dart';

class RestaurantAppBar extends StatelessWidget {
  final String coverUri;
  final String profileUri;
  final VoidCallback onFavTap;
  const RestaurantAppBar({
    Key? key,
    required this.coverUri,
    required this.profileUri,
    required this.onFavTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: Stack(
        //    alignment: AlignmentDirectional.bottomCenter,
        children: [
          ClipRRect(
            borderRadius:
                BorderRadius.vertical(bottom: Radius.elliptical(455, 130)),
            child: Image.asset(
              coverUri,
              fit: BoxFit.fill,
              height: 45.h,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: ElevatedButton(
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(5),
                shape: MaterialStateProperty.all(
                  CircleBorder(),
                ),
                backgroundColor: MaterialStateProperty.all(Color(0xFFF5F5F5)),
                alignment: Alignment.center,
                // /padding: MaterialStateProperty.all(EdgeInsets.only(left: 10)),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Icon(
                Icons.arrow_back,
                size: 26,
                color: Theme.of(context).textTheme.bodyText1!.color,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    //  margin: EdgeInsets.only(left: 16),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(image: AssetImage(profileUri)),
                      color: Colors.white,
                    ),
                    width: 86,
                    height: 86,
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 4.h),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(15),
                        shape: MaterialStateProperty.all(
                          CircleBorder(),
                        ),
                        padding: MaterialStateProperty.all(EdgeInsets.all(8)),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                      ),
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (ctx) {
                          return RestauantInfoScreen();
                        }));
                      },
                      child: Icon(
                        Icons.info,
                        size: 35,
                        color: Theme.of(context).textTheme.bodyText1!.color,
                      ),
                    ),
                  ),
                  // Row(
                  //   children: [

                  //     Padding(
                  //       padding: const EdgeInsets.only(bottom: 22),
                  //       child: ElevatedButton(
                  //         style: ButtonStyle(
                  //           elevation: MaterialStateProperty.all(15),
                  //           shape: MaterialStateProperty.all(
                  //             CircleBorder(),
                  //           ),
                  //           padding:
                  //               MaterialStateProperty.all(EdgeInsets.all(8)),
                  //           backgroundColor:
                  //               MaterialStateProperty.all(Colors.white),
                  //         ),
                  //         onPressed: onFavTap,
                  //         child: Icon(
                  //           Icons.favorite_outline_rounded,
                  //           size: 35,
                  //           color: Theme.of(context).textTheme.bodyText1!.color,
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
