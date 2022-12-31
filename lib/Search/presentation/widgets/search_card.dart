import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app/Category/data/models/product_category.dart';
import 'package:restaurant_app/Search/bloc/search_bloc.dart';

import 'filter_sheet.dart';

class SearchCard extends StatefulWidget {
  final List<ProductCategory> categories;
  const SearchCard({
    Key? key,
    required this.searchTerm,
    required this.categories,
  }) : super(key: key);

  final String searchTerm;

  @override
  State<SearchCard> createState() => _SearchCardState();
}

class _SearchCardState extends State<SearchCard> {
  num? startPriceFilter;
  num? endPriceFilter;
  List<String>? selectedCategoriesFilter;
  String searchTerm = '';

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
              child: TextFormField(
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
                initialValue: widget.searchTerm,
                onChanged: (value) {
                  searchTerm = value;
                  context.read<SearchBloc>().add(FetchSearchData(
                        searchTxt: value,
                        startPrice: startPriceFilter,
                        endPrice: endPriceFilter,
                        categories: selectedCategoriesFilter,
                      ));
                },
              ),
            ),
          ),
          const SizedBox(width: 8),
          SizedBox(
            height: 48,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  )),
                  builder: (ctx) {
                    return FilterSheet(
                      startPrice: startPriceFilter,
                      endPrice: endPriceFilter,
                      selectedCategories: selectedCategoriesFilter,
                      categories: widget.categories,
                      onApply: (stPrice, edPrice, cats) {
                        startPriceFilter = stPrice;
                        endPriceFilter = edPrice;
                        selectedCategoriesFilter = cats;
                        if (searchTerm.isNotEmpty) {
                          context.read<SearchBloc>().add(FetchSearchData(
                                searchTxt: searchTerm,
                                startPrice: startPriceFilter,
                                endPrice: endPriceFilter,
                                categories: selectedCategoriesFilter,
                              ));
                        }
                        Navigator.of(ctx).pop();
                      },
                      onClear: () {
                        if (startPriceFilter != null ||
                            endPriceFilter != null ||
                            selectedCategoriesFilter != null) {
                          startPriceFilter = null;
                          endPriceFilter = null;
                          selectedCategoriesFilter = null;
                          if (searchTerm.isNotEmpty)
                            context
                                .read<SearchBloc>()
                                .add(FetchSearchData(searchTxt: searchTerm));
                        }
                        Navigator.of(ctx).pop();
                      },
                    );
                  },
                );
              },
              child: Center(child: const Icon(Icons.tune)),
            ),
          ),
        ],
      ),
    );
  }
}
