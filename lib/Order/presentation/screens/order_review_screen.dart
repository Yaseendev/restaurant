import 'package:flavor/flavor_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app/Order/data/models/order_item.dart';
import 'package:restaurant_app/Product/data/models/product.dart';
import 'package:restaurant_app/Shared/Cart/cubit/cart_cubit.dart';
import 'package:restaurant_app/Shared/Rate/presentation/widgets/custom_app_bar.dart';
import '../widgets/order_footer_button.dart';
import '../widgets/order_review_tile.dart';
import 'checkout_screen.dart';

class OrderReviewScreen extends StatefulWidget {
  const OrderReviewScreen({Key? key}) : super(key: key);

  @override
  State<OrderReviewScreen> createState() => _OrderReviewScreenState();
}

class _OrderReviewScreenState extends State<OrderReviewScreen> {
  List<Widget> orderCards = [];

  @override
  void initState() {
    orderCards = [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, List<OrderItem>>(
      listener: (context, state) {
        if (state.isEmpty) {
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        appBar: CustomAppBar.appBarWithBackBttn(context, 'order'),
        body: BlocBuilder<CartCubit, List<OrderItem>>(
          builder: (context, state) {
            return Column(
              // padding: const EdgeInsets.all(10),
              children: [
                ListView(
                  shrinkWrap: true,
                  children: [
                    ...state.map((p) => OrderReviewCard(
                          order: p,
                        )),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 12),
                      child: Divider(),
                    ),
                    Row(
                      children: [
                        Container(
                          height: 26,
                          width: 8,
                          decoration: BoxDecoration(
                              color: AppColors.PRIMARY_COLOR,
                              borderRadius: BorderRadius.horizontal(
                                right: const Radius.circular(8),
                              )),
                        ),
                        SizedBox(width: 6),
                        Text(
                          'Add A Note',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 12),
                      child: TextField(
                        autofocus: false,
                        decoration: InputDecoration(
                          hintText: 'Write Here',
                        ),
                        textInputAction: TextInputAction.newline,
                        keyboardType: TextInputType.multiline,
                        maxLines: 5,
                        //onChanged: onWrite,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                OrderFooterButton(
                  text: 'Confirm Order',
                  priceTxt: '${state.fold(0, (num previousValue, element) => previousValue + element.totalPrice)}',
                  onPress: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_)=>CheckoutScreen()));
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
