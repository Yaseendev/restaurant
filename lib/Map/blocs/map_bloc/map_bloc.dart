import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flavor/flavor_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:restaurant_app/Branch/data/Models/branch.dart';
import 'package:restaurant_app/Branch/data/repositories/branch_repo.dart';
import 'package:restaurant_app/Map/data/models/address.dart';
import 'package:restaurant_app/Map/data/repositories/map_repository.dart';
import 'package:restaurant_app/Shared/Location/data/models/geo_latLng.dart';
import 'package:restaurant_app/Shared/Location/data/repositories/location_repository.dart';
import 'package:restaurant_app/utils/locator.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  MapBloc(BuildContext context) : super(MapInitial()) {
    final LocationRepository locationRepo = locator.get<LocationRepository>();
    bool forceUpdate = true;
    final Connectivity connectivity = locator.get<Connectivity>();
    final MapRepository mapRepo = locator.get<MapRepository>();
    final BranchRepository branchRepo = locator.get<BranchRepository>();
    
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
            address.position = event.position;
            await locationRepo.saveLocation(address);
            await locationRepo.setCurrentLocation(address);
            emit(MapLocationChoosen(address));
          }
        } catch (e) {
          emit(MapError());
        }
      } else {
        emit(MapNoConnection());
      }
    }));

    on<LoadMainMap>(((event, emit) async {
      emit(MapLoaded(
        branches: branchRepo.getAllBranches(),
        byteData: await DefaultAssetBundle.of(context).load(AppImages.MAP_PIN),
      ));
    }));

    on<GoToBranch>(((event, emit) async {
      emit(MapLoaded(
        branches: branchRepo.getAllBranches(),
        byteData: await DefaultAssetBundle.of(context).load(AppImages.MAP_PIN),
        index: event.index,
      ));
    }));
  }
}
