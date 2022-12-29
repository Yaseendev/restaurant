import 'package:flavor/flavor_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app/Branch/data/Models/branch.dart';
import 'package:restaurant_app/Category/data/models/product_category.dart';
import 'package:restaurant_app/Map/data/models/address.dart';
import 'package:restaurant_app/Offers/presentation/screens/offers_screen.dart';
import 'package:restaurant_app/Offers/presentation/widgets/offer_card_small.dart';
import 'package:restaurant_app/Product/bloc/product_bloc.dart';
import 'package:restaurant_app/Product/data/models/product.dart';
import 'package:restaurant_app/Restaurant/presenation/screens/restaurant_screen.dart';
import 'branches_section.dart';
import 'home_categoris_list_view.dart';
import 'home_product_card.dart';
import 'photo_show.dart';
import '../../../../Search/presentation/widgets/search_box.dart';
import 'selected_location_card.dart';

class HomeLoadedWidget extends StatelessWidget {
  final Address currentLocation;
  final List<ProductCategory> categories;
  final List<Branch> branches;
  final List<Address> addresses;
  final Function(int bId) onBranchSelect;
  const HomeLoadedWidget({
    Key? key,
    required this.categories,
    required this.currentLocation,
    required this.branches,
    required this.onBranchSelect,
    required this.addresses,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SelectedLocationCard(
          addresses: addresses,
          currentLocation: currentLocation,
        ),
       const SearchBox(
        
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
                            builder: (ctx) => BlocProvider<ProductBloc>(
                                  create: (context) =>
                                      ProductBloc()..add(LoadProducts()),
                                  child: RestaurantScreen(
                                    branches: branches,
                                  ),
                                )));
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
              CategoriesListView(
                categories: categories,
              ),
              SizedBox(height: 12),

              ///Popular Section
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
                            builder: (ctx) => RestaurantScreen(
                              branches: branches,
                            )));
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
                        id: 3,
                        name: 'Pizza Margherita',
                        desc: 'Mozzarella Cheese, Fresh basil and Tomatoes',
                        imgUrl: AppImages.POP1,
                        price: 30,
                        discount: 1,
                        likes: 2100,
                        options: [],
                        sizes: null,
                        categories: [],
                      ),
                    ),
                    HomeProductCard(
                      product: Product(
                        id: 4,
                        name: 'Chicken Burger',
                        desc: 'Chicken Burger',
                        imgUrl: AppImages.POP2,
                        price: 15,
                        discount: 1,
                        likes: 2100,
                        options: [],
                        sizes: null,
                        categories: [],
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

              ///Branches Section
              SizedBox(height: 12),
              Text(
                'Our Branches',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 6),
              BranchesSection(
                branches: branches,
                onSelect: onBranchSelect,
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
