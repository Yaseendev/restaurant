import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app/Primary/presentation/screens/primary_screen.dart';
import 'package:restaurant_app/Spash/blocs/initroute_bloc/initroute_bloc.dart';
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
          context.read<AccountBloc>().add(LoadUserProfileEvent());
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              settings: RouteSettings(name: '/primary'),
              builder: (ctx) {
                return PrimaryScreen();
              }));
        } else if (state is InitrouteNoToken) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              settings: RouteSettings(name: '/primary'),
              builder: (ctx) {
                return PrimaryScreen();
              }));
        } else if (state is InitrouteValidToken) {
          context.read<AccountBloc>().add(LoadUserProfileEvent());
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              settings: RouteSettings(name: '/primary'),
              builder: (ctx) {
                return PrimaryScreen();
              }));
        } else if (state is InitrouteInValidToken) {
          //Logout
          context.read<AccountBloc>().add(LogoutUserEvent());
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              settings: RouteSettings(name: '/primary'),
              builder: (ctx) {
                return PrimaryScreen();
              }));
        }
      },
      child: Scaffold(
        body: Center(
          child: LoadingWidget(),
        ),
      ),
    );
  }
}
