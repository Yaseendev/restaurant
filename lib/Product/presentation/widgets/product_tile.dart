import 'package:flavor/flavor_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app/Product/models/product.dart';
import 'package:restaurant_app/Shared/blocs/cubit/cart_cubit.dart';
import 'package:restaurant_app/utils/constants.dart';

import '../screens/product_screen.dart';

class ProductTile extends StatelessWidget {
  //final Function(dynamic) onOrder;
  final Product product;
  const ProductTile({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => ProductScreen(product)))
          .then((value) {
        if (value != null) context.read<CartCubit>().addItem(value);
         //onOrder(value);
      }),
      child: Column(
        children: [
          ListTile(
            title: ListTile(
              leading: Icon(Icons.add_box_outlined),
              title: Text(
               product.name,
               // 'Beef Burger',
                style: TextStyle(fontSize: 18),
              ),
              contentPadding: EdgeInsets.zero,
              horizontalTitleGap: 0,
              dense: true,
              iconColor: AppColors.PRIMARY_COLOR,
              minLeadingWidth: 30,
            ),
            subtitle: Text(product.desc,
                //'A simply delicious grilled 100% beef patty with onions, pickles, mustard and a dollop'
                ),
            trailing: Image.asset(product.imgUrl,
              //'assets/images/burger.png'
              ),
            isThreeLine: true,
            contentPadding: EdgeInsets.zero,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              product.discount != null ? Row(
                children: [
                  Text.rich(TextSpan(
                    text: '90',
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.lineThrough,
                    ),
                    children: [
                      TextSpan(
                        text: ' EGP',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  )),
                  SizedBox(width: 5),
                  Text.rich(TextSpan(
                    text: '75.25',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    children: [
                      TextSpan(
                        text: ' EGP',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  )),
                ],
              ) : Text.rich(TextSpan(
                    text: product.price.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    children: [
                      TextSpan(
                        text: ' EGP',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  )),
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite,
                    ),
                    color: Colors.grey,
                  ),
                  Text.rich(
                    TextSpan(
                      text: '2.1',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                      children: [
                        TextSpan(
                          text: 'k',
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}