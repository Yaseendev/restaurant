import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:numeral/numeral.dart';
import 'package:restaurant_app/Product/presentation/screens/product_screen.dart';
import 'package:restaurant_app/Product/data/models/product.dart';
import 'package:restaurant_app/Shared/Cart/cubit/cart_cubit.dart';
import '../screens/item_screen.dart';

class ItemTile extends StatelessWidget {
  //final Function(dynamic) onOrder;
  final Product item;
  const ItemTile({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => ProductScreen(item)
                //ItemScreen()
                ))
            .then((value) {
          if (value != null) context.read<CartCubit>().addItem(value);
        });
      },
      child: Column(
        children: [
          ListTile(
            title: Text(
              item.name,
              //'Beef Burger',
              style: TextStyle(fontSize: 18),
            ),
            subtitle: Text(
              item.desc,
              //'A simply delicious grilled 100% beef patty with onions, pickles, mustard and a dollop'
            ),
            trailing: Image.asset(
              item.imgUrl,
              //'assets/images/burger.png'
              width: 75,
              fit: BoxFit.fill,
            ),
            //dense: true,
            isThreeLine: true,
            contentPadding: EdgeInsets.zero,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              item.discount != null
                  ? Row(
                      children: [
                        Text.rich(TextSpan(
                          text: item.price.toString(), //'90',
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
                          text: item.finalPrice.toString(), //'75.25',
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
                    )
                  : Text.rich(TextSpan(
                      text: item.price.toString(),
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
                  Text(
                    Numeral(item.likes).format(), //'2.1',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
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
