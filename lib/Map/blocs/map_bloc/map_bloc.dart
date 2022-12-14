import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:restaurant_app/Map/data/models/address.dart';
import 'package:restaurant_app/Map/data/repositories/map_repository.dart';
import 'package:restaurant_app/Shared/Location/data/models/address_location.dart';
import 'package:restaurant_app/Shared/Location/data/repositories/location_repository.dart';
import 'package:restaurant_app/utils/locator.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  MapBloc() : super(MapInitial()) {
    final LocationRepository locationRepo = locator.get<LocationRepository>();
    bool forceUpdate = true;
    final Connectivity connectivity = locator.get<Connectivity>();
    final MapRepository mapRepo = locator.get<MapRepository>();
    //on<MapEvent>((event, emit) {
    // TODO: implement event handler
    //1. Render map in zoom out
    //2. check location permision
    //3. request location permission if not granted
    //4. Go to default loction if denied (e.g. downtown cairo)
    //   or Go to current location if allowed
    //
    //   });
    on<LoadCurrentLocation>(((event, emit) async {
      if (await locationRepo.isServiceEnable())
        emit(MapCurrentLocation(await locationRepo.getCurrentPosition()));
      else {
        forceUpdate = !forceUpdate;
        emit(MapServiceDisabled(forceUpdate));
      }
    }));

    on<ChooseLocation>(((event, emit) async {
      final connStatus = await connectivity.checkConnectivity();
      if (connStatus != ConnectivityResult.none) {
        emit(MapLoading());
        late final Address? address;
        try {
          address = await mapRepo.getReversedGeoCode(event.position);
          if (address != null) {
            final AddressLocation addressLocation = AddressLocation(
              position: event.position,
              name: address.name,
            );
            await locationRepo.saveLocation(addressLocation);
            await locationRepo.setCurrentLocation(addressLocation);
            emit(MapLocationChoosen(addressLocation));
          }
        } catch (e) {
          emit(MapError());
        }
      } else {
        emit(MapNoConnection());
      }
    }));
  }
}
