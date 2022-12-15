import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:restaurant_app/Shared/Location/data/repositories/location_repository.dart';
import 'package:restaurant_app/User/data/repositories/account_repositories.dart';
import 'package:restaurant_app/utils/locator.dart';
import 'package:restaurant_app/utils/services/location_service.dart';

part 'initroute_event.dart';
part 'initroute_state.dart';

class InitrouteBloc extends Bloc<InitrouteEvent, InitrouteState> {
  InitrouteBloc(Bloc accountBloc) : super(InitrouteInitial()) {
    final Connectivity connectivity = locator.get<Connectivity>();
    final AccoountRepository accoountRepository =
        locator.get<AccoountRepository>();
    final LocationService locationr = locator.get<LocationService>();
    final LocationRepository locationRepo = locator.get<LocationRepository>();
    on<InitrouteEvent>((event, emit) async {
      log(accountBloc.toString());
      final connStatus = await connectivity.checkConnectivity();
      if (event is UserCheckEvent) {
        if (connStatus != ConnectivityResult.none) { //FIXME 
          await accoountRepository.tokenCheck();
          await locationRepo.isAddressKnown().then((isKnown) {
            if (isKnown)
              emit(InitrouteProceed());
            else {
              if (connStatus != ConnectivityResult.none) {
              emit(InitrouteNoLocation());
              } else emit(InitrouteNoInternet());
            }
          });
          // .then((value) {
          //   if (value == null) {
          //     emit(InitrouteNoToken());
          //   } else {
          //     if (value) {
          //       emit(InitrouteValidToken());
          //     } else {
          //       emit(InitrouteInValidToken());
          //     }
          //   }
          // }).onError((error, stackTrace) {
          //   emit(InitrouteError());
          // });
        } else
          emit(InitrouteNoInternet());
      }
    });
  }
   @override
  void onEvent( event) {
    super.onEvent(event);
    log('Event $event Patched');
  }

  @override
  void onChange(Change<InitrouteState> change) {
    super.onChange(change);
    log('State $change emmited');
  }
}