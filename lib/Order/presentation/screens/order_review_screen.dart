import 'package:flavor/flavor_colors.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/Shared/widgets/custom_app_bar.dart';
import 'package:restaurant_app/utils/constants.dart';

import '../widgets/order_footer_button.dart';
import '../widgets/order_review_tile.dart';

class OrderReviewScreen extends StatefulWidget {
  const OrderReviewScreen({Key? key}) : super(key: key);

  @override
  State<OrderReviewScreen> createState() => _OrderReviewScreenState();
}

class _OrderReviewScreenState extends State<OrderReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.appBarWithBackBttn(context, 'order'),
      body: Column(
        // padding: const EdgeInsets.all(10),
        children: [
          ListView(
            shrinkWrap: true,
            children: [
              OrderReviewCard(),
              OrderReviewCard(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
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
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
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
            priceTxt: '175.25',
            onPress: () {
              //Navigator.of(context).pop((productPrice + totalOptions) * ammount);
            },
          ),
        ],
      ),
    );
  }
}
