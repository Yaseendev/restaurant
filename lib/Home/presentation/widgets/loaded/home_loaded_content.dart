import 'package:flavor/flavor_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_app/Offers/presentation/screens/offers_screen.dart';
import 'package:restaurant_app/Offers/presentation/widgets/offer_card_small.dart';
import 'package:restaurant_app/Product/models/product.dart';
import 'package:restaurant_app/Product/presentation/widgets/category_card.dart';
import 'package:restaurant_app/Product/presentation/widgets/product_card.dart';
import 'package:restaurant_app/Restaurant/presenation/screens/restaurant_screen.dart';
import 'home_product_card.dart';
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Hey, what are you looking for?',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: TextButton.icon(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (ctx) => RestaurantScreen()));
                      },
                      label: const Text('See All'),
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
                    CategoryCard(
                      image: AppImages.CAT1,
                      title: 'Hot Drinks',
                      index: 0,
                    ),
                    CategoryCard(
                      image: AppImages.CAT2,
                      title: 'Cold Drinks',
                      index: 1,
                    ),
                    CategoryCard(
                      image: AppImages.CAT3,
                      title: 'Baked Goods',
                      index: 2,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Popular Now',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: TextButton.icon(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (ctx) => RestaurantScreen()));
                      },
                      label: const Text('See All'),
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
                    //TODO
                    HomeProductCard(
                      product: Product(
                        name: 'Tea',
                        desc: 'Fresh Hot Tea',
                        imgUrl: AppImages.POP1,
                        price: 12,
                        discount: 1,
                        likes: 2100,
                        options: [],
                        sizes: null,
                      ),
                    ),
                    HomeProductCard(
                      product: Product(
                        name: 'Chocolate Muffin',
                        desc: 'Baked Chocolate Muffin',
                        imgUrl: AppImages.POP2,
                        price: 16,
                        discount: 1,
                        likes: 2100,
                        options: [],
                        sizes: null,
                      ),
                    ),
                    // HomeProductCard(
                    //   product: Product(
                    //     name: 'Beef Burger',
                    //     desc:
                    //         'Grilled beef patty with onions, pickles, mustard and a dollop',
                    //     imgUrl: 'assets/images/burger_sandwich.png',
                    //     price: 90,
                    //     discount: 14.5,
                    //     likes: 2100,
                    //     options: [],
                    //     sizes: null,
                    //   ),
                    //  ),
                  ],
                ),
              ),
              SizedBox(height: 12),
              Text(
                'Our Branches',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 6),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    //ProductCard(),
                    RestaurantCard(
                      addressName: 'Rehab (Estern Sooq)',
                      address: 'أمام بوابه الدخول',
                    ),
                    RestaurantCard(
                      addressName: 'Nasr City',
                      address: 'شرق مدينة نصر',
                    ),
                  ],
                ),
              ),
              /* DefaultTabController(
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
                                ProductCard(),
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
              ),*/
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
