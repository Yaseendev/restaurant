import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:restaurant_app/Map/data/models/address.dart';
import 'package:restaurant_app/Map/data/repositories/map_repository.dart';
import 'package:restaurant_app/Shared/Location/data/models/geo_latLng.dart';
import 'package:restaurant_app/Shared/Location/data/repositories/location_repository.dart';
import 'package:restaurant_app/utils/locator.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationBloc() : super(LocationInitial()) {
    final Connectivity connectivity = locator.get<Connectivity>();
    final LocationRepository locationRepo = locator.get<LocationRepository>();
    final MapRepository mapRepo = locator.get<MapRepository>();
    on<DetectCurrentLocation>((event, emit) async {
      if (await connectivity.checkConnectivity() != ConnectivityResult.none) {
        try {
          final Position? position = await locationRepo.getCurrentPosition();
          if (position != null) {
            await mapRepo
                .getReversedGeoCode(GeoLatLng.fromPosition(position))
                .then((location) => location == null
                    ? emit(LocationError())
                    : emit(LocationDetected(currentLocation: location)))
                .onError((error, stackTrace) => emit(LocationError()));
          } else {
            emit(LocationError());
          }
        } catch (e) {
          emit(LocationError());
        }
      } else {
        emit(LocationError());
      }
    });
  }
}
