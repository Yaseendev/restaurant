import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app/Home/blocs/home_bloc/home_bloc.dart';
import '../widgets/loaded/home_loaded_content.dart';
import '../widgets/loading/home_loading_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
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
