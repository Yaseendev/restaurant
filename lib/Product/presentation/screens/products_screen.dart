import 'package:flavor/flavor_assets.dart';
import 'package:flavor/flavor_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_app/Order/models/order_item.dart';
import 'package:restaurant_app/Product/models/product.dart';
import 'package:restaurant_app/Product/models/product_option.dart';
import 'package:restaurant_app/Shared/blocs/cubit/cart_cubit.dart';
import 'package:restaurant_app/Shared/presentation/widgets/custom_app_bar.dart';
import '../../../Order/presentation/widgets/cart_button.dart';
import '../widgets/products_listView.dart';
import '../../../Order/presentation/screens/order_review_screen.dart';

class ProductsScreen extends StatefulWidget {
  final int initIndex;
  const ProductsScreen({
    Key? key,
    this.initIndex = 0,
  }) : super(key: key);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController =
        TabController(length: 3, initialIndex: widget.initIndex, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.appBarWithBackBttn(context, 'Products'),
      body: Column(
        children: [
          Container(
            color: Color(0xFFFAFAFA),
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
                                    elevation: MaterialStateProperty.all(5),
                                    shape: MaterialStateProperty.all(
                                      CircleBorder(),
                                    ),
                                    backgroundColor: MaterialStateProperty.all(
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
                                            'Hot Drinks',
                                            // 'Burger Sandwiches',
                                            style: TextStyle(fontSize: 16),
                                          ),
                                          trailing: Text(
                                            '20',
                                            style: TextStyle(fontSize: 18),
                                          ),
                                          onTap: () {
                                            Navigator.pop(context, 0);
                                          },
                                        ),
                                        ListTile(
                                          title: Text(
                                            'Cold Drinks',
                                            style: TextStyle(fontSize: 16),
                                          ),
                                          trailing: Text(
                                            '20',
                                            style: TextStyle(fontSize: 18),
                                          ),
                                          onTap: () {
                                            Navigator.pop(context, 1);
                                          },
                                        ),
                                        ListTile(
                                          title: Text(
                                            'Baked Goods',
                                            style: TextStyle(fontSize: 16),
                                          ),
                                          trailing: Text(
                                            '10',
                                            style: TextStyle(fontSize: 18),
                                          ),
                                          onTap: () {
                                            Navigator.pop(context, 2);
                                          },
                                        ),
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
                    indicatorPadding: EdgeInsets.symmetric(horizontal: 16),
                    tabs: [
                      Tab(
                        text: 'Hot Drinks',
                      ),
                      Tab(
                        text: 'Cold Drinks',
                      ),
                      Tab(
                        text: 'Baked Goods',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                ProductsListView(
                  title: 'Hot Drinks',
                  products: [
                    Product(
                      name: 'Tea',
                      desc: 'Hot Fresh Tea',
                      imgUrl: AppImages.POP1,
                      price: 20,
                      sizes: [
                        ProductOption(
                          name: 'Medium',
                          price: 10,
                        ),
                        ProductOption(
                          name: 'Large',
                          price: 20,
                        ),
                      ],
                      options: null,
                      likes: 2100,
                    ),
                    Product(
                      name: 'French Coffee',
                      desc: 'Hot French Coffee',
                      imgUrl: AppImages.CAT1_POP2,
                      price: 25,
                      sizes: [
                        ProductOption(
                          name: 'Medium',
                          price: 15,
                        ),
                        ProductOption(
                          name: 'Large',
                          price: 25,
                        ),
                      ],
                      options: null,
                      likes: 2100,
                    ),
                    Product(
                      name: 'Flat White',
                      desc: 'Hot Flat White',
                      imgUrl: AppImages.CAT1_POP3,
                      price: 35,
                      sizes: [
                        ProductOption(
                          name: 'Medium',
                          price: 25,
                        ),
                        ProductOption(
                          name: 'Large',
                          price: 35,
                        ),
                      ],
                      options: null,
                      likes: 2100,
                    ),
                  ],
                  onProducrOrder: (ordersList) {
                    print('added');
                    // setState(() {
                    //   orders.addAll(ordersList);
                    // });
                  },
                ),
                ProductsListView(
                  title: 'Cold Drinks',
                  products: [
                    Product(
                      name: 'Oreo Milkshake',
                      desc: 'Fresh Oreo Milkshake',
                      price: 30,
                      sizes: null,
                      options: null,
                      imgUrl: AppImages.CAT2_POP1,
                      likes: 2000,
                    ),
                    Product(
                      name: 'American Ice Coffee',
                      desc: 'Cold American Ice Coffee',
                      price: 35,
                      sizes: null,
                      options: null,
                      imgUrl: AppImages.CAT2_POP2,
                      likes: 2000,
                    ),
                    Product(
                      name: 'Redbull',
                      desc: 'Cold Redbull',
                      price: 30,
                      sizes: null,
                      options: null,
                      imgUrl: AppImages.CAT2_POP3,
                      likes: 2000,
                    ),
                  ],
                  onProducrOrder: (ordersList) {
                    // setState(() {
                    //   orders.addAll(ordersList);
                    // });
                  },
                ),
                ProductsListView(
                  title: 'Baked Goods',
                  products: [
                    Product(
                      name: 'Romi Croissants',
                      desc: 'Croissants with romi cheese',
                      price: 15,
                      sizes: null,
                      options: null,
                      imgUrl: AppImages.CAT3_POP1,
                      likes: 2000,
                    ),
                    Product(
                      name: 'Cheese Pateh',
                      desc: 'Pateh with white cheese',
                      price: 12,
                      sizes: null,
                      options: null,
                      imgUrl: AppImages.CAT3_POP2,
                      likes: 2000,
                    ),
                    Product(
                      name: 'Chocolate Muffin',
                      desc: 'Tasty Chocolate Muffin',
                      price: 16,
                      sizes: null,
                      options: null,
                      imgUrl: AppImages.CAT3_POP3,
                      likes: 2000,
                    ),
                  ],
                  onProducrOrder: (ordersList) {
                    // setState(() {
                    //   orders.addAll(ordersList);
                    // });
                  },
                ),
              ],
            ),
          ),
          //SizedBox(height: orders.isEmpty ? 0 : 14.h),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: BlocBuilder<CartCubit, List<OrderItem>>(
        builder: (context, state) {
          return state.isEmpty
              ? Container()
              : CartButton(
                  orders: state,
                  onPress: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (ctx) {
                      return OrderReviewScreen();
                    }));
                  },
                );
        },
      ),
    );
  }
}
