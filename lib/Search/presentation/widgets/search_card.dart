import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app/Search/bloc/search_bloc.dart';

class SearchCard extends StatelessWidget {
  const SearchCard({
    Key? key,
    required this.searchTerm,
  }) : super(key: key);

  final String searchTerm;

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
                initialValue: searchTerm,
                onChanged: (value) {
                  context
                      .read<SearchBloc>()
                      .add(FetchSearchData(searchTxt: value));
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
              onPressed: () {},
              child: Center(child: const Icon(Icons.tune)),
            ),
          ),
        ],
      ),
    );
  }
}
