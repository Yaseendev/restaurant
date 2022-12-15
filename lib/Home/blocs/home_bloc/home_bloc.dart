import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app/Branch/data/Models/branch.dart';
import 'package:restaurant_app/Branch/data/repositories/branch_repo.dart';
import 'package:restaurant_app/Category/data/models/product_category.dart';
import 'package:restaurant_app/Category/data/repositories/category_repository.dart';
import 'package:restaurant_app/Home/data/repositories/home_repository.dart';
import 'package:restaurant_app/Shared/Location/data/models/address_location.dart';
import 'package:restaurant_app/Shared/Location/data/repositories/location_repository.dart';
import 'package:restaurant_app/utils/locator.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(BuildContext context) : super(HomeInitial()) {
    final Connectivity connectivity = locator.get<Connectivity>();
    final HomeRepository repository =
        RepositoryProvider.of<HomeRepository>(context);
    final BranchRepository branchRepository = locator.get<BranchRepository>();
    final LocationRepository locationRepository =
        locator.get<LocationRepository>();
    final CategoryRepository categoryRepository =
        locator.get<CategoryRepository>();
    on<FetchHomeScreenData>((event, emit) async {
      emit(HomeLoading());
      if (await connectivity.checkConnectivity() != ConnectivityResult.none) {
        //TODO: 1.get branch id
        //2. get home data based on branch id

        try {
          final AddressLocation? currentLocation =
              locationRepository.getCurrentLocation();
          //TODO: if(currentLocation == null) emit No currentLocation
          final Branch? currentBranch = await branchRepository
              .fetchBranchData(currentLocation!); //TODO: Handle null case
          locator.get<Branch>().update(currentBranch!);
          emit(HomeLoaded(
            addressLocation: currentLocation,
            categories:
                await categoryRepository.getCategories(currentBranch.id!) ??
                    [], //TODO: Handle null case
            branches:
                await branchRepository.fetchBranchAddresses() ??
                    [], //TODO: Handle null case
          ));
        } catch (e) {
          //TODO: emit error
          log('Error $e');
        }
      } else {
        log('No internet');
        //TODO: emit no internet
      }
    });
  }

  @override
  void onEvent(HomeEvent event) {
    super.onEvent(event);
    log('Event $event Patched');
  }

  @override
  void onChange(Change<HomeState> change) {
    super.onChange(change);
    log('State $change');
  }
}