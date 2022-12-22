part of 'account_bloc.dart';

@immutable
abstract class AccountEvent extends Equatable {}

class LoginWithFacebookEvent extends AccountEvent {
  LoginWithFacebookEvent();

  @override
  List<Object> get props => [];
}

class LoadUserProfileEvent extends AccountEvent {
  @override
  List<Object> get props => [];
}

class RegisterUserEvent extends AccountEvent {
  final Name name;
  final String password;
  final String phoneNum;
  final String email;
  final String gender;

  RegisterUserEvent({
    required this.name,
    required this.password,
    required this.phoneNum,
    required this.email,
    required this.gender,
  });

  @override
  List<Object> get props => [name, email, password, phoneNum];
}

class LoginWithEmailEvent extends AccountEvent {
  final String password;
  final String email;

  LoginWithEmailEvent({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [email, password];
}

class LogoutUserEvent extends AccountEvent {
  @override
  List<Object> get props => [];
}

class UpdateUserEvent extends AccountEvent {
  final Name? name;
  final String? phoneNum;
  final String? gender;

  UpdateUserEvent({
     this.name,
     this.gender,
     this.phoneNum,
  });

  @override
  List<Object?> get props => [name, phoneNum, gender];
}