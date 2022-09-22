part of 'account_bloc.dart';

@immutable
abstract class AccountState extends Equatable {}

class AccountInitial extends AccountState {

  @override
  List<Object?> get props => [];
}

class AccountLoading extends AccountState {
  @override
  List<Object?> get props => [];
}

class AccountNoInternet extends AccountState {
  @override
  List<Object?> get props => [];
}

class AccountLoggedIn extends AccountState {
  final User? user;

  AccountLoggedIn(this.user);

  @override
  List<Object?> get props => [this.user];
}

class AccountError extends AccountState {
  @override
  List<Object?> get props => [];
}
