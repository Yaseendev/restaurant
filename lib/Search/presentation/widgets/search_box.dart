import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:restaurant_app/Product/data/models/product.dart';
import 'package:restaurant_app/Product/presentation/screens/product_screen.dart';
import 'package:restaurant_app/Search/bloc/search_bloc.dart';
import 'package:restaurant_app/Search/data/repositories/search_repository.dart';
import 'package:restaurant_app/Shared/Cart/cubit/cart_cubit.dart';
import 'package:restaurant_app/utils/locator.dart';
import '../screens/search_screen.dart';

class SearchBox extends StatefulWidget {
  const SearchBox({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchBox> createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  String searchText = '';
  List<Product> products = [];
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: SizedBox(
              height: 48,
              child: TypeAheadField(
                hideOnLoading: true,
                minCharsForSuggestions: 1,
                textFieldConfiguration: TextFieldConfiguration(
                  maxLines: 1,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        width: 0,
                        color: Color(0xFFF6F6F6),
                        style: BorderStyle.none,
                      ),
                    ),
                    fillColor: const Color(0xFFF6F6F6),
                    filled: true,
                    hintText: 'Search',
                    prefixIcon: const Icon(Icons.search),
                  ),
                  textAlignVertical: TextAlignVertical.bottom,
                  onChanged: (value) {
                    searchText = value;
                    if (value.isEmpty) products.clear();
                  },
                ),
                suggestionsCallback: (pattern) async {
                  print(pattern);

                  //if (pattern.isEmpty) return [];
                  return await locator
                      .get<SearchRepository>()
                      .fetchSearchResult(pattern)
                      .then((values) => products = values);
                },
                autoFlipDirection: true,
                keepSuggestionsOnLoading: false,
                itemBuilder: (context, Product suggestion) {
                  // return Container();
                  return ListTile(
                    horizontalTitleGap: 0,
                    leading: Icon(Icons.fastfood_rounded),
                    title: Text(suggestion.name),
                    subtitle: Text('${suggestion.categories[0].name}'),
                    trailing: Text('${suggestion.price} EGP'),
                  );
                },
                onSuggestionSelected: (Product suggestion) {
                  Navigator.of(context)
                      .push(MaterialPageRoute(
                          builder: (_) => ProductScreen(suggestion)))
                      .then((value) {
                    if (value != null) context.read<CartCubit>().addItem(value);
                  });
                },
              ),
            ),
          ),
          SizedBox(width: 8),
          SizedBox(
            height: 48,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => BlocProvider<SearchBloc>(
                          create: (context) => SearchBloc(),
                          child: SearchScreen(
                            initText: searchText,
                            initResult: products,
                          ),
                        )));
              },
              child: Center(child: Icon(Icons.tune)),
            ),
          ),
        ],
      ),
    );
  }
}
