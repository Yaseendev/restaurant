import 'package:flutter/material.dart';

import '../widgets/order_card.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrains) {
      print(constrains.maxWidth);
      return constrains.maxWidth < 500
          ? ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              children: [
                OrderCard(),
                OrderCard(),
                OrderCard(),
                OrderCard(),
                OrderCard(),
                OrderCard(),
                OrderCard(),
              ],
            )
          : SingleChildScrollView(
              child: Wrap(
                alignment: WrapAlignment.spaceEvenly,
                // shrinkWrap: true,
                // padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                children: [
                  OrderCard(),
                  OrderCard(),
                  OrderCard(),
                  OrderCard(),
                  OrderCard(),
                  OrderCard(),
                  OrderCard(),
                ],
              ),
            );
    });
  }
}
