import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app/Map/blocs/map_bloc/map_bloc.dart';
import 'package:restaurant_app/Map/presentation/screens/initial_map_screen.dart';
import 'package:restaurant_app/Primary/presentation/screens/primary_screen.dart';
import 'package:restaurant_app/Splash/blocs/initroute_bloc/initroute_bloc.dart';
import 'package:restaurant_app/User/blocs/account_bloc/account_bloc.dart';
import '../widgets/loading_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<InitrouteBloc, InitrouteState>(
      listener: (context, state) {
        if (state is InitrouteError) {
          //TODO: Go to error page
          // context.read<AccountBloc>().add(LoadUserProfileEvent());
          // Navigator.of(context).pushReplacement(MaterialPageRoute(
          //     settings: RouteSettings(name: '/primary'),
          //     builder: (ctx) {
          //       return PrimaryScreen();
          //     }));
        } else if (state is InitrouteNoLocation) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              settings: RouteSettings(name: '/primary'),
              builder: (ctx) {
                return InitialMapScreen();
              }));
        }
         else if (state is InitrouteProceed) {
        //   context.read<AccountBloc>().add(LoadUserProfileEvent());
        //   Navigator.of(context).pushReplacement(MaterialPageRoute(
        //       settings: RouteSettings(name: '/primary'),
        //       builder: (ctx) {
        //         return PrimaryScreen();
        //       }));
        // } else if (state is InitrouteInValidToken) {
        //   //Logout
        //   context.read<AccountBloc>().add(LogoutUserEvent());
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              settings: RouteSettings(name: '/primary'),
              builder: (ctx) {
                return PrimaryScreen();
              }));
        }
        if (state is InitrouteNoInternet) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              settings: RouteSettings(name: '/primary'),
              builder: (ctx) {
                return PrimaryScreen();
              }));
        }
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        //Colors.white,
        body: Center(
          child: LoadingWidget(),
        ),
      ),
    );
  }
}
