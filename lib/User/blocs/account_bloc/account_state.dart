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
  final bool? forceFlag;

  AccountNoInternet([this.forceFlag]);

  @override
  List<Object?> get props => [forceFlag];
}

class AccountLoggedIn extends AccountState {
  final User? user;

  AccountLoggedIn(this.user);

  @override
  List<Object?> get props => [this.user];
}

class AccountUpdated extends AccountState {
  final User user;

  AccountUpdated(this.user);

  @override
  List<Object?> get props => [this.user];
}

class AccountLoggedOut extends AccountState {

  @override
  List<Object?> get props => [];
}

class AccountError extends AccountState {
  final String? errMsg;
  AccountError({this.errMsg});

  @override
  List<Object?> get props => [errMsg];
}
