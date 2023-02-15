import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:restaurant_app/Product/data/models/product.dart';
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
    bool forceNoInternetState = true;
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
          forceNoInternetState = !forceNoInternetState;
          emit(AccountNoInternet(forceNoInternetState));
        }
      } else if (event is LoginWithGoogleEvent) {
        if (connStatus != ConnectivityResult.none) {
          emit(AccountLoading());
          await accoountRepository.loginWithGoogle().then((result) {
            if (result != null)
              emit(AccountLoggedIn(result));
            else
              emit(AccountError());
          }).onError((error, stackTrace) {
            emit(AccountError());
          });
        } else {
          forceNoInternetState = !forceNoInternetState;
          emit(AccountNoInternet(forceNoInternetState));
        }
      } else if (event is RegisterUserEvent) {
        if (connStatus != ConnectivityResult.none) {
          emit(AccountLoading());
          await accoountRepository
              .registerUser(
                name: event.name,
                password: event.password,
                phoneNum: event.phoneNum,
                email: event.email,
                gender: event.gender,
              ) //TODO: Handle the error proporly
              .then((result) => emit(AccountLoggedIn(result)))
              .onError((error, stackTrace) => emit(AccountError()));
        } else {
          forceNoInternetState = !forceNoInternetState;
          emit(AccountNoInternet(forceNoInternetState));
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
              .onError((error, stackTrace) {
            if (error is DioError)
              emit(AccountError(errMsg: error.response?.data['errors'][0]));
          });
        } else {
          forceNoInternetState = !forceNoInternetState;
          emit(AccountNoInternet(forceNoInternetState));
        }
      } else if (event is LogoutUserEvent) {
        await accoountRepository
            .logoutUser()
            .then((_) => emit(AccountLoggedOut()))
            .onError((error, stackTrace) => emit(AccountError()));
      } else if (event is LoadUserProfileEvent) {
        await accoountRepository.fetchUser().then((value) {
          value != null ? emit(AccountLoggedIn(value)) : emit(AccountInitial());
        }).onError((error, stackTrace) {
          print('Error $error');
          emit(AccountInitial());
        });
      } else if (event is UpdateUserEvent) {
        if (connStatus != ConnectivityResult.none) {
          emit(AccountLoading());
          await accoountRepository
              .updateUserData(
            name: event.name,
            phone: event.phoneNum,
            gender: event.gender,
          )
              .then((value) {
            value != null
                ? emit(AccountLoggedIn(value))
                : emit(AccountError(errMsg: 'Something went wrong'));
          }).onError((error, stackTrace) {
            emit(AccountError(errMsg: 'Something went wrong'));
          });
        } else {
          forceNoInternetState = !forceNoInternetState;
          emit(AccountNoInternet(forceNoInternetState));
        }
      } else if (event is RemoveProdFav) {
        final tempuser = state.props[0] as User;
        await accoountRepository
            .removeFromFavorite(tempuser, event.product)
            .then((value) => emit(state is AccountLoggedIn ? AccountUpdated(tempuser) : AccountLoggedIn(tempuser)))
            .onError((error, stackTrace) => emit(AccountError()));
      }
    });
  }

  @override
  void onChange(Change<AccountState> change) {
    log('AccountBloc $change');
    super.onChange(change);
  }
}
