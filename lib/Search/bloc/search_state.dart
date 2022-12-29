part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {
  @override
  List<Object> get props => [];
}

class SearchLoading extends SearchState {
  @override
  List<Object> get props => [];
}

class SearchLoaded extends SearchState {
  final List<Product> products;

  SearchLoaded(this.products);

  @override
  List<Object> get props => [products];
}

class SearchNoInternet extends SearchState {
  @override
  List<Object> get props => [];
}
