import 'package:flavor/flavor_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_app/Shared/widgets/custom_app_bar.dart';
import 'package:restaurant_app/utils/constants.dart';
import '../widgets/cart_button.dart';
import '../widgets/products_listView.dart';
import 'order_review_screen.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  final List<num> orders = []; //FIXME
  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
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
                                            'Burger Sandwiches',
                                            style: TextStyle(fontSize: 16),
                                          ),
                                          trailing: Text(
                                            '3',
                                            style: TextStyle(fontSize: 18),
                                          ),
                                          onTap: () {
                                            Navigator.pop(context, 0);
                                          },
                                        ),
                                        ListTile(
                                          title: Text(
                                            'Meals',
                                            style: TextStyle(fontSize: 16),
                                          ),
                                          trailing: Text(
                                            '2',
                                            style: TextStyle(fontSize: 18),
                                          ),
                                          onTap: () {
                                            Navigator.pop(context, 1);
                                          },
                                        ),
                                        ListTile(
                                          title: Text(
                                            'Kids Meals',
                                            style: TextStyle(fontSize: 16),
                                          ),
                                          trailing: Text(
                                            '20',
                                            style: TextStyle(fontSize: 18),
                                          ),
                                          onTap: () {
                                            Navigator.pop(context, 2);
                                          },
                                        ),
                                        ListTile(
                                          title: Text(
                                            'Burger Sandwiches',
                                            style: TextStyle(fontSize: 16),
                                          ),
                                          trailing: Text(
                                            '7',
                                            style: TextStyle(fontSize: 18),
                                          ),
                                          onTap: () {
                                            Navigator.pop(context, 3);
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
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                ProductsListView(
                  title: 'Burger Sandwiches',
                  onProducrOrder: (ordersList) {
                    print('added');
                    setState(() {
                      orders.addAll(ordersList);
                    });
                  },
                ),
                ProductsListView(
                  title: 'Meals',
                  onProducrOrder: (ordersList) {
                    setState(() {
                      orders.addAll(ordersList);
                    });
                  },
                ),
                ProductsListView(
                  title: 'Kids Meals',
                  onProducrOrder: (ordersList) {
                    setState(() {
                      orders.addAll(ordersList);
                    });
                  },
                ),
                ProductsListView(
                  title: 'Burger Sandwiches',
                  onProducrOrder: (ordersList) {
                    setState(() {
                      orders.addAll(ordersList);
                    });
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: orders.isEmpty ? 0 : 14.h),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: orders.isEmpty
          ? null
          : CartButton(
              orders: orders,
              onPress: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                  return OrderReviewScreen();
                }));
              },
            ),
    );
  }
}
