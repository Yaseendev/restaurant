import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:restaurant_app/Map/data/models/address.dart';
import 'package:restaurant_app/Shared/Location/data/repositories/location_repository.dart';
import 'package:restaurant_app/User/data/models/user.dart';
import 'package:restaurant_app/User/data/repositories/account_repositories.dart';
import 'package:restaurant_app/utils/locator.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc() : super(OrderInitial()) {
    final Connectivity connectivity = locator.get<Connectivity>();
    final AccoountRepository accoountRepository =
        locator.get<AccoountRepository>();
    final LocationRepository locationRepository =
        locator.get<LocationRepository>();
    bool forceNoInternetState = false;
    bool forceNotLoggedInState = false;
    on<CheckoutEvent>((event, emit) async {
      if (await connectivity.checkConnectivity() != ConnectivityResult.none) {
        final user = await accoountRepository.fetchUser();
        if (user != null) {
          final Address? currentLocation =
              locationRepository.getCurrentLocation();
          if (currentLocation == null) {
            emit(OrderError());
          } else {
            emit(OrderReady(user: user,
            currentAddress: currentLocation,
            ));
          }
        } else {
          forceNotLoggedInState = !forceNotLoggedInState;
          emit(OrderNotLoggedIn(forceNotLoggedInState));
        }
      } else {
        forceNoInternetState = !forceNoInternetState;
        emit(OrderNoInerntet(forceNoInternetState));
      }
    });
  }
}
