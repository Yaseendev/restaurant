import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app/Order/data/models/order_item.dart';
import 'package:restaurant_app/Order/presentation/screens/order_review_screen.dart';
import 'package:restaurant_app/Product/data/models/product.dart';
import 'package:restaurant_app/Shared/Cart/cubit/cart_cubit.dart';

class CustomAppBar {
  static PreferredSizeWidget appBar(BuildContext context, String title) {
    return AppBar(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
      title: Text(title.toUpperCase()),
      titleTextStyle:
          Theme.of(context).textTheme.headline6!.copyWith(color: Colors.black),
      centerTitle: true,
      elevation: 4,
      toolbarHeight: 65,
      actions: [
        BlocBuilder<CartCubit, List<OrderItem>>(
          builder: (context, state) {
            return state.isEmpty
                ? Container()
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Badge(
                      badgeColor: Theme.of(context).primaryColor,
                      badgeContent: Text(
                        state.length.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      showBadge: state.isNotEmpty,
                      position: BadgePosition.topEnd(
                        end: -5,
                        // top: 5,
                      ),
                      padding: EdgeInsets.all(6),
                      child: IconButton(
                        color: Colors.black,
                        onPressed: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (ctx) {
                            return OrderReviewScreen();
                          }));
                        },
                        icon: const Icon(Icons.shopping_cart_checkout),
                      ),
                    ),
                  );
          },
        ),
      ],
    );
  }

  static PreferredSizeWidget appBarWithBackBttn(
      BuildContext context, String title) {
    return AppBar(
      leading: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          shape: MaterialStateProperty.all(
            CircleBorder(),
          ),
          backgroundColor: MaterialStateProperty.all(Color(0xFFF5F5F5)),
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Icon(
          Icons.arrow_back,
          size: 26,
          color: Theme.of(context).textTheme.bodyText1!.color,
        ),
      ),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
      title: Text(title.toUpperCase()),
      titleTextStyle:
          Theme.of(context).textTheme.headline6!.copyWith(color: Colors.black),
      centerTitle: true,
      elevation: 4,
      toolbarHeight: 65,
    );
  }
}
