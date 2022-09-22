import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:restaurant_app/User/data/models/name.dart';
import 'package:restaurant_app/User/data/models/user.dart';
import 'package:restaurant_app/User/data/repositories/account_repositories.dart';
import 'package:restaurant_app/utils/locator.dart';
part 'account_event.dart';
part 'account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  AccountBloc() : super(AccountInitial()) {
    final Connectivity connectivity = locator.get<Connectivity>();
    final AccoountRepository accoountRepository =
        locator.get<AccoountRepository>();
    on<AccountEvent>((event, emit) async {
      final connStatus = await connectivity.checkConnectivity();
      if (event is LoginWithFacebookEvent) {
        if (connStatus != ConnectivityResult.none) {
          emit(AccountLoading());
          await accoountRepository.loginWithFacebook().then((result) {
            if (result != null)
              emit(AccountLoggedIn(result));
            else
              emit(AccountError());
          }).onError((error, stackTrace) {
            emit(AccountError());
          });
        } else {
          emit(AccountNoInternet());
        }
      } else if (event is RegisterUserEvent) {
        if (connStatus != ConnectivityResult.none) {
          emit(AccountLoading());
          await accoountRepository
              .registerUser(
                  name: event.name,
                  password: event.password,
                  phoneNum: event.phoneNum,
                  email: event.email)
              .then((result) => emit(AccountLoggedIn(result)))
              .onError((error, stackTrace) => emit(AccountError()));
        } else {
          emit(AccountNoInternet());
        }
      } else if (event is LoginWithEmailEvent) {
        if (connStatus != ConnectivityResult.none) {
          emit(AccountLoading());
          await accoountRepository
              .loginWithEmail(
                email: event.email,
                password: event.password,
              )
              .then((result) => emit(AccountLoggedIn(result)))
              .onError((error, stackTrace) => emit(AccountError()));
        } else {
          emit(AccountNoInternet());
        }
      } else if (event is LogoutUserEvent) {
        await accoountRepository
            .logoutUser()
            .then((_) => emit(AccountInitial()))
            .onError((error, stackTrace) => emit(AccountError()));
      } else if (event is LoadUserProfileEvent) {
        await accoountRepository.fetchUser().then((value) {
          value != null ? emit(AccountLoggedIn(value)) : emit(AccountInitial());
        }).onError((error, stackTrace) {
          emit(AccountInitial());
        });
      }
    });
  }
}
