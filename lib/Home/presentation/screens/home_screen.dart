import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_app/Branch/data/Models/branch.dart';
import 'package:restaurant_app/Home/blocs/home_bloc/home_bloc.dart';
import 'package:restaurant_app/Map/blocs/map_bloc/map_bloc.dart';
import 'package:restaurant_app/utils/constants.dart';
import '../widgets/loaded/home_loaded_content.dart';
import '../widgets/loading/home_loading_widget.dart';

class HomeScreen extends StatelessWidget {
  final Function(int id) onBranchCardTap;
  const HomeScreen({
    Key? key,
    required this.onBranchCardTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is HomeLoaded) context.read<MapBloc>().add(LoadMainMap());
      },
      builder: (context, state) {
        return SizedBox(
          height: MediaQuery.of(context).size.height,
          child: RefreshIndicator(
            onRefresh: () async {
              context.read<HomeBloc>().add(FetchHomeScreenData());

              //await Future.delayed(Duration(seconds: 5)).then((value) => false);
            },
            child: ListView(
              children: [
                if (state is HomeLoading) HomeLoadingWidget(),
                if (state is HomeLoaded)
                  HomeLoadedWidget(
                    currentLocation: state.addressLocation!,
                    categories: state.categories,
                    branches: state.branches,
                    onBranchSelect: onBranchCardTap,
                    addresses: state.addresses,
                  ),
                if (state is HomeError)
                  Center(
                    child: Text(
                      'Something went wrong',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                if (state is HomeNoConnection)
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * .15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(14),
                            child: Image.asset(
                              Images.NOCONN,
                              width: 160.sp,
                              height: 160.sp,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        const Text(
                          'You are not connected\nPlease connect to a network and try again',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                SizedBox(height: 30),
              ],
            ),
          ),
        );
      },
    );
  }
}
