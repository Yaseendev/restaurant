import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app/Product/data/models/product.dart';
import 'package:restaurant_app/Restaurant/presenation/widgets/products_tabview_loading.dart';
import 'package:restaurant_app/Search/bloc/search_bloc.dart';
import 'package:restaurant_app/Shared/Rate/presentation/widgets/custom_app_bar.dart';
import '../widgets/search_card.dart';
import '../widgets/search_result_tiles.dart';

class SearchScreen extends StatefulWidget {
  final String initText;
  final List<Product> initResult;

  const SearchScreen({
    super.key,
    this.initText = '',
    this.initResult = const [],
  });

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late String searchTerm;
  late List<Product> result;

  @override
  void initState() {
    searchTerm = widget.initText;
    result = widget.initResult;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SearchBloc, SearchState>(
      listener: (context, state) {
        if (state is SearchLoaded) result = state.products;
      },
      child: Scaffold(
        appBar: CustomAppBar.appBarWithBackBttn(context, 'search'),
        body: ListView(
          shrinkWrap: true,
          children: [
            SearchCard(searchTerm: searchTerm),
            const SizedBox(height: 12),
            BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                if (state is SearchLoading) return ProductsTabViewLoading();
                if (state is SearchLoaded)
                  return SearchResultTiles(result: state.products);
                return SearchResultTiles(result: result);
              },
            ),
          ],
        ),
      ),
    );
  }
}
