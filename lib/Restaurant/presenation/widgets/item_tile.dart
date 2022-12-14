import 'package:cached_network_image/cached_network_image.dart';
import 'package:flavor/flavor_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:numeral/numeral.dart';
import 'package:restaurant_app/Product/blocs/product_bloc/product_bloc.dart';
import 'package:restaurant_app/Product/presentation/screens/product_screen.dart';
import 'package:restaurant_app/Product/data/models/product.dart';
import 'package:restaurant_app/Shared/Cart/cubit/cart_cubit.dart';
import 'package:restaurant_app/utils/constants.dart';
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
            .push(MaterialPageRoute(
                builder: (_) => BlocProvider<ProductBloc>(
                      create: (context) =>
                          ProductBloc(item)..add(LoadProduct()),
                      child: ProductScreen(item),
                    )
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
            trailing: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: item.imgUrl,
                height: 90,
                width: 90,
                fit: BoxFit.fill,
                errorWidget: (context, error, stackTrace) {
                  return Image.asset(
                    Images.CATEGORY_PLACEHOLDER,
                    height: 90,
                    width: 90,
                    fit: BoxFit.fill,
                  );
                },
                placeholder: (context, _) {
                  return Image.asset(
                    Images.CATEGORY_PLACEHOLDER,
                    height: 90,
                    width: 90,
                    fit: BoxFit.fill,
                  );
                },
              ),
              //'assets/images/burger.png'
            ),
            isThreeLine: true,
            contentPadding: EdgeInsets.zero,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              item.type == 'variable'
                  ? Text(
                      'Price on selection',
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.PRIMARY_COLOR,
                      ),
                    )
                  : item.discount != null
                      ? Row(
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
