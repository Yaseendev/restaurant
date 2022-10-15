import 'package:flavor/flavor_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_app/Restaurant/presenation/widgets/restaurant_app_bar.dart';
import 'package:restaurant_app/Restaurant/presenation/widgets/restaurant_header.dart';
import 'package:restaurant_app/Restaurant/presenation/widgets/restaurant_stats_widget.dart';
import '../widgets/order_footer_buttons.dart';
import '../widgets/orders_switch.dart';
import '../widgets/previous_order_card.dart';
import '../../../Product/presentation/screens/products_screen.dart';

enum OrderType { previous, current }

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              RestaurantAppBar(
                coverUri: 'assets/images/cover.png',
                profileUri: AppImages.TRANSAPPLOGO,
                onFavTap: () {},
              ),
              RestaurantHeader(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: RestaurantStatsWidget(),
              ),
              OrdersSwitch(
                initialValue: OrderType.previous,
                segments: const {
                  OrderType.previous: Text(
                    'Previous Orders',
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  // OrderType.current: Text(
                  //   'Current',
                  //   textAlign: TextAlign.center,
                  // ),
                },
                onChange: (v) {},
              ),
              Column(
                children: [
                  PreviousOrderCard(),
                  // PreviousOrderCard(),
                  // PreviousOrderCard(),
                  // PreviousOrderCard(),
                ],
              ),
              SizedBox(height: 14.h),
            ],
          ),
        ),
        floatingActionButton: OrderFooterButtons(
          onStartPress: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
              return ProductsScreen();
            }));
          },
          onBasketPress: () {},
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
