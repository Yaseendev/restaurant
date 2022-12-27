import 'package:flavor/flavor_assets.dart';
import 'package:flavor/flavor_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_app/Order/data/models/order_item.dart';
import 'package:restaurant_app/Product/bloc/product_bloc.dart';
import 'package:restaurant_app/Product/data/models/product.dart';
import 'package:restaurant_app/Product/data/models/product_option.dart';
import 'package:restaurant_app/Shared/Cart/cubit/cart_cubit.dart';
import 'package:restaurant_app/Shared/Rate/presentation/widgets/custom_app_bar.dart';
import '../../../Order/presentation/widgets/cart_button.dart';
import '../widgets/products_listView.dart';
import '../../../Order/presentation/screens/order_review_screen.dart';
import '../widgets/products_loaded.dart';
import '../widgets/products_loading.dart';

class ProductsScreen extends StatelessWidget {
  final int initIndex;
  const ProductsScreen({
    Key? key,
    this.initIndex = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProductBloc, ProductState>(
      listener: (context, state) {
       
      },
      child: Scaffold(
        appBar: CustomAppBar.appBarWithBackBttn(context, 'Products'),
        body: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state is ProductLoaded) {
              return ProductsView(state.products, initIndex: initIndex,);
            }
            return ProductsLoading();
          },
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
      ),
    );
  }
}
