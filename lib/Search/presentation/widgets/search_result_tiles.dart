import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app/Product/blocs/product_bloc/product_bloc.dart';
import 'package:restaurant_app/Product/data/models/product.dart';
import 'package:restaurant_app/Product/presentation/screens/product_screen.dart';
import 'package:restaurant_app/Shared/Cart/cubit/cart_cubit.dart';
import 'package:restaurant_app/utils/constants.dart';

class SearchResultTiles extends StatelessWidget {
  const SearchResultTiles({
    Key? key,
    required this.result,
  }) : super(key: key);

  final List<Product> result;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: ListTile.divideTiles(
          context: context,
          tiles: result.map((product) => GestureDetector(
                onTap: () => Navigator.of(context)
                    .push(MaterialPageRoute(
                        builder: (_) => BlocProvider<ProductBloc>(
                              create: (context) =>
                                  ProductBloc(product)..add(LoadProduct()),
                              child: ProductScreen(product),
                            )))
                    .then((value) {
                  if (value != null) context.read<CartCubit>().addItem(value);
                }),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: CachedNetworkImage(
                        imageUrl: product.imgUrl,
                        height: 80,
                        width: 70,
                        fit: BoxFit.cover,
                        errorWidget: (context, error, stackTrace) {
                          return Image.asset(
                            Images.CATEGORY_PLACEHOLDER,
                            height: 80,
                            width: 70,
                            fit: BoxFit.cover,
                          );
                        },
                        placeholder: (context, _) {
                          return Image.asset(
                            Images.CATEGORY_PLACEHOLDER,
                            height: 80,
                            width: 70,
                            fit: BoxFit.cover,
                          );
                        },
                      ),
                      title: Text(
                        product.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      subtitle: Text('${product.categories[0].name}'),
                      trailing: Text('${product.price} EGP'),
                    ),
                  ),
                ),
              ))).toList(),
    );
  }
}
