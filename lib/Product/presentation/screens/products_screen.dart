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
  final List<num> orders = []; //FIXME
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
                                            'Pizza',
                                            // 'Burger Sandwiches',
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
                                            'Macaroni',
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
                                            'Sandwiches',
                                            style: TextStyle(fontSize: 16),
                                          ),
                                          trailing: Text(
                                            '5',
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
                        text: 'Pizza',
                      ),
                      Tab(
                        text: 'Macaroni',
                      ),
                      Tab(
                        text: 'Sandwiches',
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
                  title: 'Pizza',
                  products: [
                    Product(
                      name: 'Pizza Margherita',
                      desc:
                          'San Marzano tomatoes, mozzarella cheese, fresh basil, salt, and extra-virgin olive oil',
                      imgUrl: AppImages.CAT1_POP1,
                      price: 80,
                      sizes: [
                        ProductOption(
                          name: 'Small',
                          price: 38,
                        ),
                        ProductOption(
                          name: 'Medium',
                          price: 61,
                        ),
                        ProductOption(
                          name: 'Large',
                          price: 80,
                        ),
                      ],
                      options: null,
                      likes: 2100,
                    ),
                    Product(
                      name: 'Cheese Mix',
                      desc: 'Mozzarella cheese, Cheddar Cheese, Kiri, Romi',
                      imgUrl: AppImages.CAT1_POP2,
                      price: 99,
                      sizes: [
                        ProductOption(
                          name: 'Small',
                          price: 50,
                        ),
                        ProductOption(
                          name: 'Medium',
                          price: 75,
                        ),
                        ProductOption(
                          name: 'Large',
                          price: 99,
                        ),
                      ],
                      options: null,
                      likes: 2100,
                    ),
                    // Product(
                    //   name: 'Mixed Chocolate Cake',
                    //   desc:
                    //       'طبقات من كيكة الشكولاته الاسفنجية حشو كريمة شوكولاتة حشو مكسرات الفنش : مكس شوكولاتة ( كيت كات – ماكرون – مالتيزارز- اوريو)',
                    //   imgUrl: 'flavor/assets/images/cake3.jpg',
                    //   price: 130,
                    //   sizes: null,
                    //   options: null,
                    //   likes: 2100,
                    // ),
                  ],
                  onProducrOrder: (ordersList) {
                    print('added');
                    setState(() {
                      orders.addAll(ordersList);
                    });
                  },
                ),
                ProductsListView(
                  title: 'Macaroni',
                  products: [
                    Product(
                      name: 'Bolonis Spagetti',
                      desc: 'Meat, Red Sauce',
                      price: 42,
                      sizes: null,
                      options: null,
                      imgUrl: AppImages.CAT2_POP1,
                      likes: 2000,
                    ),
                    Product(
                      name: 'Arabitta Macaroni',
                      desc: 'Bitta with tomato sauce',
                      price: 27,
                      sizes: null,
                      options: null,
                      imgUrl: AppImages.CAT2_POP2,
                      likes: 2000,
                    ),
                    Product(
                      name: 'Pasta with Sauces',
                      desc: 'Pasta, Red Sauce',
                      price: 42,
                      sizes: null,
                      options: null,
                      imgUrl: AppImages.CAT2_POP3,
                      likes: 2000,
                    ),
                  ],
                  onProducrOrder: (ordersList) {
                    setState(() {
                      orders.addAll(ordersList);
                    });
                  },
                ),
                ProductsListView(
                  title: 'Sandwiches',
                  products: [
                    Product(
                      name: 'Chicken Roll',
                      desc:
                          'Chiken Breasts wraped with cheese, olive and sauces',
                      price: 56,
                      sizes: [
                        ProductOption(
                          name: 'Medium',
                          price: 41,
                        ),
                        ProductOption(
                          name: 'Large',
                          price: 56,
                        ),
                      ],
                      options: null,
                      imgUrl: AppImages.CAT3_POP1,
                      likes: 2000,
                    ),
                    Product(
                      name: 'Atork Chicken',
                      desc:
                          'Chicken Pieces, Hot dog, Mushroom, Mozzarella, Sauce Khabzino',
                      price: 55,
                      sizes: [
                        ProductOption(
                          name: 'Medium',
                          price: 42,
                        ),
                        ProductOption(
                          name: 'Large',
                          price: 55,
                        ),
                      ],
                      options: null,
                      imgUrl: AppImages.CAT3_POP2,
                      likes: 2000,
                    ),
                    Product(
                      name: 'Super Crunchy',
                      desc:
                          'Spicy Chicken Pieces, Cheddar, Romi, Salami, Kabotcha, Mayonis',
                      price: 57,
                      sizes: [
                        ProductOption(
                          name: 'Medium',
                          price: 43,
                        ),
                        ProductOption(
                          name: 'Large',
                          price: 57,
                        ),
                      ],
                      options: null,
                      imgUrl: AppImages.CAT3_POP3,
                      likes: 2000,
                    ),
                  ],
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
