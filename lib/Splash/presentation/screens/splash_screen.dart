import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app/Home/blocs/home_bloc/home_bloc.dart';
import 'package:restaurant_app/Map/presentation/screens/initial_map_screen.dart';
import 'package:restaurant_app/Primary/presentation/screens/primary_screen.dart';
import 'package:restaurant_app/Splash/blocs/initroute_bloc/initroute_bloc.dart';
import 'package:restaurant_app/User/blocs/account_bloc/account_bloc.dart';
import '../widgets/loading_widget.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<InitrouteBloc, InitrouteState>(
      listener: (context, state) {
        if (state is InitrouteNoLocation) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              settings: RouteSettings(name: '/primary'),
              builder: (ctx) {
                return InitialMapScreen();
              }));
        } else if (state is InitrouteProceed || state is InitrouteError) {
          context.read<HomeBloc>().add(FetchHomeScreenData());
          context.read<AccountBloc>().add(LoadUserProfileEvent());
         Navigator.of(context).pushReplacement(MaterialPageRoute(
              settings: RouteSettings(name: '/primary'),
              builder: (ctx) {
                return PrimaryScreen();
              }));
        }
        if (state is InitrouteNoInternet) {
          //TODO: To be checked
          context.read<HomeBloc>().add(FetchHomeScreenData());
          context.read<AccountBloc>().add(LoadUserProfileEvent());
          
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              settings: RouteSettings(name: '/primary'),
              builder: (ctx) {
                return PrimaryScreen();
              }));
        }
      },
      child: Scaffold(
        backgroundColor:
            Colors.white,
        body: Center(
          child: LoadingWidget(),
        ),
      ),
    );
  }
}
