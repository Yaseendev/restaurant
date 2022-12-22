import 'dart:io';
import 'package:flavor/flavor_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:restaurant_app/utils/constants.dart';
import 'Home/blocs/home_bloc/home_bloc.dart';
import 'Home/data/repositories/home_repository.dart';
import 'Map/blocs/map_bloc/map_bloc.dart';
import 'Primary/presentation/screens/primary_screen.dart';
import 'Shared/Cart/cubit/cart_cubit.dart';
import 'Splash/blocs/initroute_bloc/initroute_bloc.dart';
import 'Splash/presentation/screens/splash_screen.dart';
import 'User/blocs/account_bloc/account_bloc.dart';
import 'utils/locator.dart';
import 'utils/services/http_override.dart';

void main(List<String> arguments) async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  await Hive.initFlutter();
  await locatorsSetup();
  HttpOverrides.global = MyHttpOverrides();
  //Stripe.publishableKey = 'pk_test_51Ls01HLynaEsGmGgB9VxL3iMEtwxRMMizxseDFzlCg3dnZvpaHids2hdnDitGN1ppzUSjmCnsH25BbovwfiHkT5h00Or9YzRrG';
  //await Stripe.instance.applySettings();
  runApp(MyApp(
    title: appName, //arguments.isEmpty ? 'Restaurant App' : arguments[0],
  ));
}

class MyApp extends StatelessWidget {
  final String title;
  const MyApp({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(315, 177),
        minTextAdapt: true,
        builder: (context, child) {
          return RepositoryProvider<HomeRepository>(
        create: (context) => HomeRepository(),
            child: MultiBlocProvider(
              providers: [
                BlocProvider<AccountBloc>(
                  create: (context) => AccountBloc(),
                ),
                BlocProvider<InitrouteBloc>(
                  create: (context) =>
                      InitrouteBloc(BlocProvider.of<AccountBloc>(context))
                        ..add(UserCheckEvent()),
                ),
                BlocProvider<CartCubit>(
                  create: (context) => CartCubit(),
                ),
                BlocProvider<MapBloc>(
                  create: (context) => MapBloc(context),
                ),
                BlocProvider<HomeBloc>(
                  create: (context) =>
                      HomeBloc(context),),
          
              ],
              child: MaterialApp(
                title: title,
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  //primaryColor: Colors.red,
                  primarySwatch: AppColors.PRIMARY_SWATCH,
                ),
                home: const SplashScreen(), //PrimaryScreen(),//const SplashScreen(),
              ),
            ),
          );
        });
  }
}
