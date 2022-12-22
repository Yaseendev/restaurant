part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final Address? addressLocation;
  final List<ProductCategory> categories;
  final List<Branch> branches;
  final List<Address> addresses;

  HomeLoaded({
    required this.addressLocation,
    required this.categories,
    required this.branches,
    required this.addresses,
  });

  @override
  List<Object?> get props => [addressLocation, categories, addresses, branches];
}

class HomeError extends HomeState {}

class HomeNoConnection extends HomeState {}
