part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class FetchHomeScreenData extends HomeEvent {
  @override
  List<Object> get props => [];
}

class ReloadHomeScreenData extends HomeEvent {
  final Address currentAddress;
  final List<Branch> branches;
  ReloadHomeScreenData({
    required this.currentAddress,
    required this.branches,
  });

  @override
  List<Object> get props => [currentAddress, branches];
}
