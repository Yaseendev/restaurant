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
                      //TODO: Add to flavor consts
                      image: 'flavor/assets/images/beans.png',
                      title: 'Fool',
                      index: 0,
                    ),
                    CategoryCard(
                      image: 'flavor/assets/images/falafel.png',
                      title: 'Taameya',
                      index: 1,
                    ),
                    CategoryCard(
                      image: 'flavor/assets/images/pizzaLogo.png',
                      title: 'Pizza',
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
                        name: 'Pizza',
                        desc: 'Cheese, Tomatos, Onions, Cold meats',
                        imgUrl: 'flavor/assets/images/pizza.png',
                        price: 90,
                        discount: 14.5,
                        likes: 2100,
                        options: [],
                        sizes: null,
                      ),
                    ),
                    HomeProductCard(
                      product: Product(
                        name: 'Pasta',
                        desc: 'Macaroni, Mozzarella, Mushrooms',
                        imgUrl: 'flavor/assets/images/pasta.png',
                        price: 40,
                        discount: 14.5,
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
                      address: '63ش فريد سميكة-ميدان الحجاز ,مصر الجديدة',
                    ),
                    RestaurantCard(
                      address: '97ش التحرير ,الدقى',
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
