import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app/Product/blocs/product_bloc/product_bloc.dart';
import 'package:restaurant_app/Product/data/models/product.dart';
import 'package:restaurant_app/Shared/Rate/presentation/widgets/custom_app_bar.dart';
import 'package:restaurant_app/User/blocs/account_bloc/account_bloc.dart';
import 'package:restaurant_app/User/data/models/user.dart';
import 'package:restaurant_app/utils/constants.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({
    super.key,
  });

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.appBarWithBackBttn(context, 'Favorite'),
      body: BlocBuilder<AccountBloc, AccountState>(
        builder: (context, state) {
          final favorites = (state.props[0] as User).favorites;
          return favorites.isNotEmpty
              ? ListView(
                  shrinkWrap: true,
                  children: ListTile.divideTiles(
                      context: context,
                      tiles: favorites.map((product) => Card(
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
                                subtitle: Text('${product.desc}'),
                                trailing: IconButton(
                                  onPressed: () {
                                    BlocProvider.of<AccountBloc>(context)
                                        .add(RemoveProdFav(product: product));
                                  },
                                  icon: Icon(Icons.favorite),
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ))).toList(),
                )
              : Center(
                  child: Text('No Items'),
                );
        },
      ),
    );
  }
}
