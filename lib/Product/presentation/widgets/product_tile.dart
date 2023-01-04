import 'package:cached_network_image/cached_network_image.dart';
import 'package:flavor/flavor_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app/Product/blocs/product_bloc/product_bloc.dart';
import 'package:restaurant_app/Product/data/models/product.dart';
import 'package:restaurant_app/Shared/Cart/cubit/cart_cubit.dart';
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
          .push(MaterialPageRoute(
              builder: (ctx) => BlocProvider<ProductBloc>(
                    create: (ctx) =>
                        ProductBloc(product)..add(LoadProduct()),
                    child: ProductScreen(product),
                  )))
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
                style: TextStyle(fontSize: 18),
              ),
              contentPadding: EdgeInsets.zero,
              horizontalTitleGap: 0,
              dense: true,
              iconColor: AppColors.PRIMARY_COLOR,
              minLeadingWidth: 30,
            ),
            subtitle: Text(
              product.desc,
              //'A simply delicious grilled 100% beef patty with onions, pickles, mustard and a dollop'
            ),
            trailing: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: product.imgUrl,
                height: 90,
                width: 90,
                fit: BoxFit.fill,
                errorWidget: (context, error, stackTrace) {
                  return Image.asset(
                    Images.CATEGORY_PLACEHOLDER,
                    height: 90,
                    width: 90,
                    fit: BoxFit.cover,
                  );
                },
                placeholder: (context, _) {
                  return Image.asset(
                    Images.CATEGORY_PLACEHOLDER,
                    height: 90,
                    width: 90,
                    fit: BoxFit.cover,
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
              product.type == 'variable'
                  ? Text(
                      'Price on selection',
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.PRIMARY_COLOR,
                      ),
                    )
                  : product.discount != null
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.favorite,
                      color: Colors.grey,
                    ),
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
