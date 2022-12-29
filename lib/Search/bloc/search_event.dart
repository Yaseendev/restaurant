part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object?> get props => [];
}

class FetchSearchData extends SearchEvent {
  final String searchTxt;
  final num? startPrice;
  final num? endPrice;
  final List<String>? categories;

  FetchSearchData({
       required this.searchTxt, 
       this.startPrice,
        this.endPrice,
         this.categories,
         });

  @override
  List<Object?> get props => [
    searchTxt,
    startPrice,
    endPrice,
    categories,
       ];
}
