part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductInitial extends ProductState {
  final Product product;

  ProductInitial(this.product);


  @override
  List<Object> get props => [product];
}

class ProductLoading extends ProductState {


  @override
  List<Object> get props => [];
}

class ProductLoaded extends ProductState {
  final bool isFav;

  ProductLoaded(this.isFav);
  

  @override
  List<Object> get props => [isFav];
}

class ProductNotLoggedIn extends ProductState {
  

  @override
  List<Object> get props => [];
}

class ProductError extends ProductState {
  

  @override
  List<Object> get props => [];
}
