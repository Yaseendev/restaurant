part of 'products_bloc.dart';

abstract class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object> get props => [];
}

class ProductsInitial extends ProductsState {
  @override
  List<Object> get props => [];
}

class ProductLoading extends ProductsState {
  @override
  List<Object> get props => [];
}

class ProductsLoaded extends ProductsState {
  final Map<ProductCategory, List<Product>> products;
  ProductsLoaded(this.products);

  @override
  List<Object> get props => [products];
}

class ProductNoInternet extends ProductsState {
  
  @override
  List<Object> get props => [];
}
