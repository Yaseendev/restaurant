part of 'order_bloc.dart';

abstract class OrderState extends Equatable {
  const OrderState();

  @override
  List<Object?> get props => [];
}

class OrderInitial extends OrderState {}

class OrderNoInerntet extends OrderState {
  final bool? forceFlag;

  OrderNoInerntet([this.forceFlag]);

  @override
  List<Object?> get props => [forceFlag];
}

class OrderNotLoggedIn extends OrderState {
  final bool? forceFlag;

  OrderNotLoggedIn([this.forceFlag]);

  @override
  List<Object?> get props => [forceFlag];
}

class OrderError extends OrderState {
  final bool? forceFlag;

  OrderError([this.forceFlag]);

  @override
  List<Object?> get props => [forceFlag];
}

class OrderReady extends OrderState {
  final User user;
  final Address currentAddress;

  OrderReady({
    required this.currentAddress,
    required this.user,
  });

  @override
  List<Object?> get props => [user, currentAddress];
}
