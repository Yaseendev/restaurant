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
import 'package:restaurant_app/Map/data/models/address.dart';
import 'package:restaurant_app/Product/data/repositories/product_repository.dart';
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
    final ProductRepository productRepository =
        locator.get<ProductRepository>();

    on<FetchHomeScreenData>((event, emit) async {
      emit(HomeLoading());
      if (await connectivity.checkConnectivity() != ConnectivityResult.none) {
        try {
          final Address? currentLocation =
              locationRepository.getCurrentLocation();
          final Branch? currentBranch =
              await branchRepository.fetchBranchData(currentLocation!);
          final List<Branch> branches =
              await branchRepository.fetchBranchAddresses() ?? [];
          locator.get<Branch>().update(currentBranch!);
          locator.get<List<Branch>>()
            ..clear()
            ..addAll(branches);
          final categories =
              await categoryRepository.getCategories(currentBranch.id!);
          //categories?.sort((a, b) => a.id.compareTo(b.id));
          emit(HomeLoaded(
            addressLocation: currentLocation,
            categories: categories ?? [],
            branches: branches,
            addresses: await locationRepository.getSavedLocations(),
          ));
        } catch (e) {
          emit(HomeError());
          log('Error $e');
        }
      } else {
        log('No internet');
        emit(HomeNoConnection());
      }
    });

    on<ReloadHomeScreenData>((event, emit) async {
      if (await connectivity.checkConnectivity() != ConnectivityResult.none) {
        emit(HomeLoading());
        await locationRepository.saveLocation(event.currentAddress);
        await locationRepository.setCurrentLocation(event.currentAddress);
        try {
          final Branch? currentBranch =
              await branchRepository.fetchBranchData(event.currentAddress);
          emit(HomeLoaded(
            addressLocation: event.currentAddress,
            categories:
                await categoryRepository.getCategories(currentBranch!.id!) ??
                    [], //TODO: Handle null case
            branches: event.branches,
            addresses: await locationRepository.getSavedLocations(),
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
