import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app/Home/blocs/home_bloc/home_bloc.dart';
import 'package:restaurant_app/Map/blocs/map_bloc/map_bloc.dart';
import '../widgets/loaded/home_loaded_content.dart';
import '../widgets/loading/home_loading_widget.dart';
import '../widgets/no_connection_widget.dart';

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
                if (state is HomeLoading) const HomeLoadingWidget(),
                if (state is HomeLoaded)
                  HomeLoadedWidget(
                    currentLocation: state.addressLocation!,
                    categories: state.categories,
                    branches: state.branches,
                    onBranchSelect: onBranchCardTap,
                    addresses: state.addresses,
                  ),
                if (state is HomeError)
                  const Center(
                    child: const Text(
                      'Something went wrong',
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                if (state is HomeNoConnection) const NoConnectionWidget(),
                const SizedBox(height: 30),
              ],
            ),
          ),
        );
      },
    );
  }
}
