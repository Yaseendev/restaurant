import 'package:flavor/flavor_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app/Order/models/order_item.dart';
import 'package:restaurant_app/Product/models/product.dart';
import 'package:restaurant_app/Shared/blocs/cubit/cart_cubit.dart';
import 'package:restaurant_app/utils/constants.dart';

class OrderReviewCard extends StatefulWidget {
  final OrderItem order;
  const OrderReviewCard({
    Key? key,
    required this.order,
  }) : super(key: key);

  @override
  State<OrderReviewCard> createState() => _OrderReviewCardState();
}

class _OrderReviewCardState extends State<OrderReviewCard> {
  // int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 6),
      title: Text(
        widget.order.product.name,
        //'Beef Burger',
        style: TextStyle(fontSize: 18),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(height: 8),
          //Text('Large, Extra Onion, Add more meat'), //TODO: Implement
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text.rich(TextSpan(
                text: '${(widget.order.totalPrice / widget.order.quantity)}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: ' EGP',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 13,
                    ),
                  ),
                ],
              )),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: widget.order.quantity <= 1
                        ? () =>
                            context.read<CartCubit>().removeItem(widget.order)
                        : () {
                            if (widget.order.quantity > 1) {
                              setState(() {
                                // --quantity;
                                context
                                    .read<CartCubit>()
                                    .reduceItemQnt(widget.order);
                              });
                              // widget.onUpdate(ammount);
                            }
                          },
                    icon: Icon(Icons.minimize_rounded),
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(bottom: 16),
                    color: AppColors.PRIMARY_COLOR,
                    iconSize: 30,
                    disabledColor: Color(0xFFF5A7AB),
                  ),
                  Text(
                    '${widget.order.quantity}', //TODO: Implement
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        //TODO: Implement
                        //++quantity;
                        context.read<CartCubit>().increaseItemQnt(widget.order);
                      });
                      // widget.onUpdate(ammount);
                    },
                    icon: Icon(Icons.add),
                    alignment: Alignment.center,
                    //padding:const EdgeInsets.symmetric(vertical: 6),
                    color: AppColors.PRIMARY_COLOR,
                    iconSize: 30,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      isThreeLine: true,
      trailing: Image.asset(
        widget.order.product.imgUrl,
        fit: BoxFit.fill,
      ),
    );
  }
}
