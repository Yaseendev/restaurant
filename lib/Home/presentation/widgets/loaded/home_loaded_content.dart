import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_app/Offers/presentation/screens/offers_screen.dart';
import 'offer_card_small.dart';
import 'photo_show.dart';
import 'restaurant_card.dart';
import 'search_box.dart';

class HomeLoadedWidget extends StatelessWidget {
  const HomeLoadedWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          child: SearchBox(
            onPress: (value) {
              print(value);
            },
          ),
        ),
        SizedBox(height: 8),
        PhotoShow(),
        SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DefaultTabController(
                length: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  //shrinkWrap: true,
                  children: [
                    TabBar(
                      isScrollable: true,
                      indicatorSize: TabBarIndicatorSize.label,
                      labelColor: Theme.of(context).primaryColor,
                      labelPadding: EdgeInsets.only(right: 14),
                      // indicatorPadding: const EdgeInsets.all(14),
                      labelStyle: TextStyle(
                        fontSize:
                            ScreenUtil().orientation == Orientation.landscape
                                ? 14.sp
                                : 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      unselectedLabelColor: Colors.black,
                      unselectedLabelStyle: TextStyle(
                        fontSize:
                            ScreenUtil().orientation == Orientation.landscape
                                ? 14.sp
                                : 18.sp,
                      ),
                      tabs: [
                        Tab(
                            child: Text(
                          'Recommended',
                        )),
                        Tab(
                          child: Text(
                            'New',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 185,
                      child: TabBarView(
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              //padding: EdgeInsets.all(10),
                              //scrollDirection: Axis.horizontal,
                              // shrinkWrap: true,
                              children: [
                                RestaurantCard(),
                                RestaurantCard(),
                              ],
                            ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              //padding: EdgeInsets.all(10),
                              //scrollDirection: Axis.horizontal,
                              // shrinkWrap: true,
                              children: [
                                RestaurantCard(),
                                RestaurantCard(),
                                RestaurantCard(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recent Offers',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: TextButton.icon(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (ctx) => OffersScreen()));
                      },
                      label: Text('Show All'),
                      icon: Icon(
                        Icons.arrow_back,
                        size: 20,
                      ),
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(EdgeInsets.zero),
                      ),
                    ),
                  ),
                ],
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    OfferCardSmall(),
                    //SizedBox(width: 10),
                    OfferCardSmall(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
