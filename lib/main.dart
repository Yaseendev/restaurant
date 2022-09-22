//import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flavor/flavor_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:restaurant_app/Spash/blocs/initroute_bloc/initroute_bloc.dart';
import 'package:restaurant_app/utils/constants.dart';
import 'Primary/presentation/screens/primary_screen.dart';
import 'Spash/presentation/screens/splash_screen.dart';
import 'User/blocs/account_bloc/account_bloc.dart';
//import 'firebase_options.dart';
import 'utils/locator.dart';

// void main_common(String title) {
//   WidgetsFlutterBinding.ensureInitialized();
//   runApp( MyApp(title: title,));

// }

void main(List<String> arguments) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await locatorsSetup();
  await Hive.initFlutter();
  //HttpOverrides.global = MyHttpOverrides();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
// );
  runApp(MyApp(
    title: arguments.isEmpty ? 'Restaurant App' : arguments[0],
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
          return MultiBlocProvider(
            providers: [
              BlocProvider<InitrouteBloc>(
                create: (context) => InitrouteBloc()..add(UserCheckEvent()),
              ),
              BlocProvider<AccountBloc>(
                create: (context) => AccountBloc(),
              ),
            ],
            child: MaterialApp(
              title: title,
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                //primaryColor: Colors.red,
                primarySwatch: AppColors.PRIMARY_SWATCH,
              ),
              home: const SplashScreen(),
            ),
          );
        });
  }
}
