import 'package:flutter/material.dart';
import 'package:restaurant_app/Product/models/product.dart';
import 'package:restaurant_app/Product/models/product_option.dart';
import 'package:vertical_tab_bar_view/vertical_tab_bar_view.dart';
import 'item_tile.dart';

class RestaurantMenuWidget extends StatefulWidget {
  const RestaurantMenuWidget({Key? key}) : super(key: key);

  @override
  State<RestaurantMenuWidget> createState() => _RestaurantMenuWidgetState();
}

class _RestaurantMenuWidgetState extends State<RestaurantMenuWidget>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
     // shrinkWrap: true,
      //scrollDirection: Axis.vertical,
      
      children: [
        Container(
          child: Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.menu),
              ),
              Expanded(
                child: TabBar(
                  controller: _tabController,
                  isScrollable: true,
                  labelColor: Colors.black,
                  indicatorPadding: EdgeInsets.symmetric(horizontal: 16),
                  tabs: [
                    Tab(
                      text: 'Burger Sandwiches',
                    ),
                    Tab(
                      text: 'Meals',
                    ),
                    Tab(
                      text: 'Kids Meals',
                    ),
                    Tab(
                      text: 'Burger Sandwiches',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        //  height: MediaQuery.of(context).size.height,
        Expanded(
          child: VerticalTabBarView(
            controller: _tabController,
            physics: NeverScrollableScrollPhysics(),
            children: [
              for (int i = 0; i < 4; i++) ItemTile(
                item: Product(
                  name: 'Beef Burger',
                  desc: 'A simply delicious grilled 100% beef patty with onions, pickles, mustard and a dollop',
                  imgUrl: 'assets/images/burger.png',
                  price: 90,
                  sizes: [
                    ProductOption(
                      name: 'Small',
                      price: 33,
                    ),
                    ProductOption(
                      name: 'Medium',
                      price: 64,
                    ),
                    ProductOption(
                      name: 'Large',
                      price: 75.25,
                    ),
                    ],
                  options: [
                    ProductOption(
                      name: 'Extra Onion',
                      price: 5,
                    ),
                    ProductOption(
                      name: 'Extra Tomato',
                      price: 8,
                    ),
                    ProductOption(
                      name: 'Add More Meat',
                      price: 20,
                    ),
                    ],
                  discount: 14.5,
                  likes: 2100,
                ),
              ),
            ],
          ),
        ),
      ],
    );

    // Scaffold(
    //   appBar: AppBar(
    //     flexibleSpace: LayoutBuilder(builder: (context, constraints) {
    //       return FlexibleSpaceBar(
    //         centerTitle: false,
    //         background: Row(
    //           children: [
    //             IconButton(
    //               onPressed: () {},
    //               icon: Icon(Icons.menu),
    //             ),
    //             Expanded(
    //               child: TabBar(
    //                 controller: _tabController,
    //                 isScrollable: true,
    //                 labelColor: Colors.black,
    //                 indicatorPadding: EdgeInsets.symmetric(horizontal: 16),
    //                 tabs: [
    //                   Tab(
    //                     text: 'Burger Sandwiches',
    //                   ),
    //                   Tab(
    //                     text: 'Meals',
    //                   ),
    //                   Tab(
    //                     text: 'Kids Meals',
    //                   ),
    //                   Tab(
    //                     text: 'Burger Sandwiches',
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ],
    //         ),
    //       );
    //     }),
    //   ),
    //   body: Container(
    //color: Color(0xFFFAFAFA),
    // height: MediaQuery.of(context).size.height * .603,
    //child: Column(
    //  children: <Widget>[
    // Expanded(
    //   child: VerticalTabBarView(
    //     physics: NeverScrollableScrollPhysics(),
    //     children: [
    //       for (int i = 0; i < 4; i++)
    //         //   SizedBox(height: 100, child: ItemTile()),
    //         Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             Align(
    //               alignment: Alignment.topLeft,
    //               child: Padding(
    //                 padding: const EdgeInsets.all(8.0),
    //                 child: Text(
    //                   'Res',
    //                   style: TextStyle(
    //                     fontWeight: FontWeight.bold,
    //                     fontSize: 36,
    //                   ),
    //                 ),
    //               ),
    //             ),
    //             ListTile(
    //               title: Text('product'),
    //               subtitle: Text('category'),
    //               onTap: () {},
    //             ),
    //           ],
    //         ),
    //     ],
    //   ),
    // ),
    //         ItemTile(),
    //       ],
    //     ),
    //   ),
    // );
  }
}
