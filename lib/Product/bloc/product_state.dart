part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductInitial extends ProductState {
  @override
  List<Object> get props => [];
}

class ProductLoading extends ProductState {
  @override
  List<Object> get props => [];
}

class ProductLoaded extends ProductState {
  final Map<ProductCategory, List<Product>> products;
  ProductLoaded(this.products);

  @override
  List<Object> get props => [products];
}

class ProductNoInternet extends ProductState {
  
  @override
  List<Object> get props => [];
}
