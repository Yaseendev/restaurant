import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app/Branch/data/Models/branch.dart';
import 'package:restaurant_app/Branch/data/repositories/branch_repo.dart';
import 'package:restaurant_app/Category/data/models/product_category.dart';
import 'package:restaurant_app/Home/data/repositories/home_repository.dart';
import 'package:restaurant_app/Shared/Location/data/models/address_location.dart';
import 'package:restaurant_app/utils/locator.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(BuildContext context) : super(HomeInitial()) {
    final Connectivity connectivity = locator.get<Connectivity>();
    final HomeRepository repository = RepositoryProvider.of<HomeRepository>(context);
    final BranchRepository branchRepository = locator.get<BranchRepository>();
    on<FetchHomeScreenData>((event, emit) async{
      emit(HomeLoading());
      try {
        // emit(
        //   HomeLoaded(
        //   addressLocation:  
        // )
        // );
      } catch (e) {
        
      }
    });
  }
}
