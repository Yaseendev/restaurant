import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flavor/flavor_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app/Branch/data/Models/branch.dart';
import 'package:restaurant_app/Order/data/models/order_item.dart';
import 'package:restaurant_app/Order/presentation/screens/order_review_screen.dart';
import 'package:restaurant_app/Order/presentation/widgets/cart_button.dart';
import 'package:restaurant_app/Product/blocs/products_bloc/products_bloc.dart';
import 'package:restaurant_app/Shared/Cart/cubit/cart_cubit.dart';
import '../widgets/products_tab_bar.dart';
import '../widgets/products_tabbar_loading.dart';
import '../widgets/products_tabbar_view.dart';
import '../widgets/products_tabview_loading.dart';
import '../widgets/restaurant_app_bar.dart';
import '../widgets/restaurant_header.dart';

class RestaurantScreen extends StatefulWidget {
  final List<Branch> branches;
  final int initIndex;
  const RestaurantScreen({
    Key? key,
    this.initIndex = 0,
    required this.branches,
  }) : super(key: key);

  @override
  State<RestaurantScreen> createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProductsBloc, ProductsState>(
      listener: (context, state) {
        if (state is ProductsLoaded)
          _tabController = TabController(
              length: state.products.length,
              initialIndex: widget.initIndex,
              vsync: this);
      },
      child: SafeArea(
        child: Scaffold(
          body: ExtendedNestedScrollView(
            physics: NeverScrollableScrollPhysics(),
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  expandedHeight: MediaQuery.of(context).size.height * .5,
                  backgroundColor: Color(0xFFFAFAFA),
                  elevation: 0,
                  floating: true,
                  pinned: true,
                  bottom: PreferredSize(
                    preferredSize: Size(MediaQuery.of(context).size.width, kToolbarHeight),
                    child: BlocBuilder<ProductsBloc, ProductsState>(
                      builder: (context, state) {
                        if (state is ProductsLoaded)
                          return ProductsTabBar(
                              products: state.products,
                              tabController: _tabController);
                        return ProductsTabBarLoading();
                      },
                    ),
                  ),
                  automaticallyImplyLeading: false,
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: false,
                    collapseMode: CollapseMode.pin,
                    background: Column(
                      children: [
                        RestaurantAppBar(
                          branches: widget.branches,
                          coverUri: AppImages.COVER,
                          profileUri: AppImages.TRANSAPPLOGO,
                          onFavTap: () {},
                        ),
                        RestaurantHeader(
                          branches: widget.branches,
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.only(bottom: 8),
                        //   child: RestaurantStatsWidget(),
                        // ),
                      ],
                    ),
                  ),
                ),
              ];
            },
            body: BlocBuilder<ProductsBloc, ProductsState>(
              builder: (context, state) {
                if (state is ProductsLoaded)
                  return ProductsTabBarView(
                    products: state.products,
                    tabController: _tabController,
                  );
                return ProductsTabViewLoading();
              },
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
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
        ),
      ),
    );
  }
}
