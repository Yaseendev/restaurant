import 'package:flutter/material.dart';
import 'package:restaurant_app/Order/data/models/order_item.dart';
import 'package:restaurant_app/Product/data/models/product.dart';

class CartButton extends StatelessWidget {
  final VoidCallback onPress;
  final List<OrderItem> orders;
  const CartButton({
    Key? key,
    required this.onPress,
    required this.orders,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 35,
      type: MaterialType.card,
      borderOnForeground: true,
      shadowColor: Colors.black,
      child: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        // height: 16.h,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        child: ElevatedButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                        width: 1.5,
                      ),
                      shape: BoxShape.circle,
                    ),
                    padding: EdgeInsets.all(8),
                    child: Text(
                      orders.length.toString(),
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    'View Order',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Text.rich(
                TextSpan(
                  text: orders
                      .fold(
                          0, (num value, element) => value + element.totalPrice)
                      .toString(),
                  children: [
                    TextSpan(
                        text: ' EGP',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                        )),
                  ],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                // textDirection: TextDirection.ltr,
                // textAlign: TextAlign.end,
              ),
            ],
          ),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          onPressed: onPress,
        ),
      ),
    );
  }
}
