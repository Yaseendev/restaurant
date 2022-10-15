import 'package:badges/badges.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flavor/flavor_assets.dart';
import 'package:flavor/flavor_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:restaurant_app/Order/models/order_item.dart';
import 'package:restaurant_app/Order/presentation/screens/order_review_screen.dart';
import 'package:restaurant_app/Order/presentation/widgets/cart_button.dart';
import 'package:restaurant_app/Product/models/product.dart';
import 'package:restaurant_app/Product/models/product_option.dart';
import 'package:restaurant_app/Restaurant/presenation/widgets/restaurant_stats_widget.dart';
import 'package:restaurant_app/Shared/blocs/cubit/cart_cubit.dart';
import '../widgets/items_listView.dart';
import '../widgets/restaurant_app_bar.dart';
import '../widgets/restaurant_header.dart';

class RestaurantScreen extends StatefulWidget {
  final int initIndex;
  const RestaurantScreen({
    Key? key,
    this.initIndex = 0,
  }) : super(key: key);

  @override
  State<RestaurantScreen> createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  bool isContolled = true;
  final List<num> orders = [];
  @override
  void initState() {
    _tabController =
        TabController(length: 3, initialIndex: widget.initIndex, vsync: this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // floatingActionButton: Badge(
        //   badgeContent: Text(
        //     _count.toString(),
        //     style: TextStyle(
        //       color: Colors.white,
        //       fontSize: 16,
        //       fontWeight: FontWeight.bold,
        //     ),
        //   ),
        //   showBadge: _count > 0,
        //   position: BadgePosition.topEnd(
        //     end: -5,
        //   ),
        //   shape: BadgeShape.square,
        //   borderRadius: BorderRadius.circular(6),
        //   child: ElevatedButton(
        //     child: Icon(FontAwesomeIcons.basketShopping),
        //     style: ElevatedButton.styleFrom(
        //       padding: const EdgeInsets.all(14),
        //       shape: RoundedRectangleBorder(
        //         borderRadius: BorderRadius.circular(16),
        //       ),
        //     ),
        //     onPressed: () {
        //       setState(() {
        //         _count++;
        //       });
        //     },
        //   ),
        // FloatingActionButton.extended(
        //   label: Text('Cart'),
        //   icon: Icon(Icons.shopping_cart_rounded),
        //   onPressed: () {
        //     setState(() {
        //       _count++;
        //     });
        //   },
        //   //child: ,
        // ),
        // ),
        body: ExtendedNestedScrollView(
          //controller: _listScroll,
          //onlyOneScrollInBody: true,
          physics: NeverScrollableScrollPhysics(),
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: MediaQuery.of(context).size.height * .7,
                backgroundColor: Color(0xFFFAFAFA),
                elevation: 0,
                floating: true,
                pinned: true,
                bottom: PreferredSize(
                  preferredSize:
                      Size(MediaQuery.of(context).size.width, kToolbarHeight),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: const Radius.circular(20),
                              ),
                            ),
                            elevation: 2,
                            isScrollControlled: true,
                            builder: (context) {
                              return SizedBox(
                                height: MediaQuery.of(context).size.height * .4,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ListTile(
                                      title: Text(
                                        'Categories',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 20,
                                        ),
                                      ),
                                      trailing: ElevatedButton(
                                        style: ButtonStyle(
                                          elevation:
                                              MaterialStateProperty.all(5),
                                          shape: MaterialStateProperty.all(
                                            CircleBorder(),
                                          ),
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Color(0xFFF5F5F5)),
                                          alignment: Alignment.center,
                                          // /padding: MaterialStateProperty.all(EdgeInsets.only(left: 10)),
                                        ),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Icon(
                                          Icons.close_rounded,
                                          size: 26,
                                          color: Theme.of(context)
                                              .textTheme
                                              .bodyText1!
                                              .color,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: ListView(
                                        shrinkWrap: true,
                                        children: [
                                          ...ListTile.divideTiles(
                                            context: context,
                                            tiles: [
                                              ListTile(
                                                title: Text(
                                                  'Fool',
                                                 // 'Burger Sandwiches',
                                                  style:
                                                      TextStyle(fontSize: 16),
                                                ),
                                                trailing: Text(
                                                  '3',
                                                  style:
                                                      TextStyle(fontSize: 18),
                                                ),
                                                onTap: () {
                                                  Navigator.pop(context, 0);
                                                },
                                              ),
                                              ListTile(
                                                title: Text(
                                                  'Taameya',
                                                  style:
                                                      TextStyle(fontSize: 16),
                                                ),
                                                trailing: Text(
                                                  '2',
                                                  style:
                                                      TextStyle(fontSize: 18),
                                                ),
                                                onTap: () {
                                                  Navigator.pop(context, 1);
                                                },
                                              ),
                                              ListTile(
                                                title: Text(
                                                  'Pizza',
                                                  style:
                                                      TextStyle(fontSize: 16),
                                                ),
                                                trailing: Text(
                                                  '5',
                                                  style:
                                                      TextStyle(fontSize: 18),
                                                ),
                                                onTap: () {
                                                  Navigator.pop(context, 2);
                                                },
                                              ),
                                              // ListTile(
                                              //   title: Text(
                                              //     'Burger Sandwiches',
                                              //     style:
                                              //         TextStyle(fontSize: 16),
                                              //   ),
                                              //   trailing: Text(
                                              //     '7',
                                              //     style:
                                              //         TextStyle(fontSize: 18),
                                              //   ),
                                              //   onTap: () {
                                              //     Navigator.pop(context, 3);
                                              //   },
                                              // ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ).then((index) {
                            if (index != null) _tabController?.animateTo(index);
                          });
                        },
                        icon: Icon(Icons.menu),
                        color: AppColors.PRIMARY_COLOR,
                      ),
                      Expanded(
                        child: TabBar(
                          controller: _tabController,
                          isScrollable: _tabController!.length > 3,
                          labelColor: Colors.black,
                          indicatorPadding:
                              EdgeInsets.symmetric(horizontal: 16),
                          tabs: [
                            Tab(
                              text: 'Fool',
                            ),
                            Tab(
                              text: 'Taameya',
                            ),
                            Tab(
                              text: 'Pizza',
                            ),
                            // Tab(
                            //   text: 'Burger Sandwiches',
                            // ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                automaticallyImplyLeading: false,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: false,
                  collapseMode: CollapseMode.pin,
                  background: Column(
                    children: [
                      RestaurantAppBar(
                        coverUri: AppImages.COVER,
                        profileUri: AppImages.TRANSAPPLOGO,
                        onFavTap: () {},
                      ),
                      RestaurantHeader(),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: RestaurantStatsWidget(),
                      ),
                    ],
                  ),
                ),
              ),
            ];
          }, //TODO: To be fixed later
          body: TabBarView(
            controller: _tabController,
            children: [
              ItemsListView(
                title: 'Fool',
                items: [
                  Product(
                  name: 'Gad Fool',
                  desc:
                      'Stew of cooked fava beans served with olive oil',
                  imgUrl: 'flavor/assets/images/fool.jpg',
                  price: 12,
                  sizes: [
                    ProductOption(
                      name: 'Shami',
                      price: 4,
                    ),
                    ProductOption(
                      name: 'Plate',
                      price: 12,
                    ),
                    // ProductOption(
                    //   name: 'Large',
                    //   price: 75.25,
                    // ),
                  ],
                  options: null,
                  // [
                  //   ProductOption(
                  //     name: 'Extra Onion',
                  //     price: 5,
                  //   ),
                  //   ProductOption(
                  //     name: 'Extra Tomato',
                  //     price: 8,
                  //   ),
                  //   ProductOption(
                  //     name: 'Add More Meat',
                  //     price: 20,
                  //   ),
                  // ],
                 // discount: 14.5,
                  likes: 2100,
                ),
                  Product(
                  name: 'Fool With Lemmon',
                  desc:
                      'Stew of cooked fava beans served with olive oil and lemmon',
                  imgUrl: 'flavor/assets/images/fool.jpg',
                  price: 14,
                  sizes: [
                    ProductOption(
                      name: 'Shami',
                      price: 5,
                    ),
                    ProductOption(
                      name: 'Plate',
                      price: 14,
                    ),
                  ],
                  options: null,
                  likes: 2100,
                ),
                  Product(
                  name: 'Hot Spicy Fool',
                  desc:
                      'Stew of cooked fava beans served with olive oil and hot chilly sauce',
                  imgUrl: 'flavor/assets/images/fool.jpg',
                  price: 14,
                  sizes: [
                    ProductOption(
                      name: 'Shami',
                      price: 5,
                    ),
                    ProductOption(
                      name: 'Plate',
                      price: 14,
                    ),
                  ],
                  options: null,
                  likes: 2100,
                ),
                ],
                onProductOrder: (order) {
                  setState(() {
                    orders.add(order);
                  });
                },
              ),
              ItemsListView(
                title: 'Taamey', //'Meals',
                items: [
                  Product(
                  name: 'Dynamite',
                  desc:
                      'Fool, Taameya, Eggplants, Potato Chips',
                  imgUrl: 'flavor/assets/images/tamey.jpg',
                  price: 9,
                  sizes:null,
                  options: null,
                  likes: 2100,
                ),
                  Product(
                  name: 'Tahabeesh Taameya',
                  desc:
                      'Taameya, Eggplants, Potato Chips, Hot Pepper',
                  imgUrl: 'flavor/assets/images/tamey.jpg',
                  price: 8,
                  sizes:null,
                  options: null,
                  likes: 2100,
                ),
                  Product(
                  name: 'Magnom Taameya',
                  desc:
                      'Taameya, Eggplants, Potato Chips, Roomy Cheese',
                  imgUrl: 'flavor/assets/images/tamey.jpg',
                  price: 8,
                  sizes: null,
                  options: null,
                  likes: 2100,
                ),
                ],
                onProductOrder: (order) { 
                  setState(() {
                    orders.add(order);
                  });
                },
              ),
              ItemsListView(
                title: 'Pizza',
                items: [
                  Product(
                  name: 'Pizza Margherita',
                  desc:
                      'Pizza dough, tomato sauce, fresh mozzarella, olive oil, basil',
                  imgUrl: 'flavor/assets/images/pizza.png',
                  price: 40,
                  sizes:null,
                  options: null,
                  likes: 2100,
                ),
                  Product(
                  name: 'Tuna Pizza',
                  desc:
                      'Pizza dough, tomato sauce, fresh mozzarella, olive oil, basil, Tuna',
                  imgUrl: 'flavor/assets/images/pizza.png',
                  price: 52,
                  sizes:null,
                  options: null,
                  likes: 2100,
                ),
                  Product(
                  name: 'Quatro Cheese Pizza',
                  desc:
                      'Pizza dough, tomato sauce, fresh mozzarella, olive oil, basil, different types of cheese',
                  imgUrl: 'flavor/assets/images/pizza.png',
                  price: 55,
                  sizes: null,
                  options: null,
                  likes: 2100,
                ),
                ],
                onProductOrder: (order) {
                  setState(() {
                    orders.add(order);
                  });
                },
              ),
              // ItemsListView(
              //   title: 'Burger Sandwiches',
              //   onProductOrder: (order) {
              //     setState(() {
              //       orders.add(order);
              //     });
              //   },
              // ),
            ],
          ),

          // body: SingleChildScrollView(
          //   controller: isContolled ? _listScroll : null,
          //   physics: NeverScrollableScrollPhysics(),
          //   child: Column(
          //       // controller: _listScroll,
          //       // physics: NeverScrollableScrollPhysics(),
          //       // padding: EdgeInsets.all(12),
          //       children: List.generate(
          //     30,
          //     (index) => AutoScrollTag(
          //       key: ValueKey(index),
          //       controller: _listScroll,
          //       index: index,
          //       child: InkWell(
          //         onTap: () {
          //           // Navigator.of(context).push(
          //           //     MaterialPageRoute(builder: (_) => ItemScreen()));
          //           setState(() {
          //             isContolled = true;
          //           });
          //           _listScroll
          //               .scrollToIndex(6,
          //                   preferPosition: AutoScrollPosition.begin)
          //               .then((value) {
          //             // print(value);
          //             // setState(() => isContolled = false);
          //           });
          //         },
          //         child:
          //             Card(child: ListTile(title: Text('Item $index'))),
          //       ),
          //     ),
          //   )
          // itemBuilder: (context, index) {
          //   return AutoScrollTag(
          //     key: ValueKey(index),
          //     controller: _listScroll,
          //     index: index,
          //     child: InkWell(
          //       onTap: () {
          //         Navigator.of(context).push(
          //             MaterialPageRoute(builder: (_) => ItemScreen()));
          //         // _listScroll.scrollToIndex(6,
          //         //     preferPosition: AutoScrollPosition.begin);
          //       },
          //       child:
          //           Card(child: ListTile(title: Text('Item $index'))),
          //     ),
          //   );
          // },
          // separatorBuilder: (context, index) {
          //   return Divider();
          // },
          // itemCount: 30,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: BlocBuilder<CartCubit, List<OrderItem>>(
          builder: (context, state) {
            return state.isEmpty ? Container()
            : CartButton(
                orders: state,
                onPress: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                    return OrderReviewScreen();
                  }));
                },
              );

          },
        )
            
            ,
      ),
    );
  }
}
