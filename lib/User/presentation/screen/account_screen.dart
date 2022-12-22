import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app/User/blocs/account_bloc/account_bloc.dart';
import '../widgets/account_content.dart';
import '../widgets/account_header.dart';
import '../widgets/followus_footer.dart';
import '../widgets/login_content.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final GlobalKey loadingKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AccountBloc, AccountState>(
      listener: (context, state) {
        if (state is AccountNoInternet) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              duration: Duration(seconds: 1), content: Text('No Internet')));
        }
        if (state is AccountLoading) {
          showDialog(
            context: context,
            builder: (ctx) {
              return Center(
                key: loadingKey,
                child: CircularProgressIndicator.adaptive(),
              );
            },
            barrierDismissible: false,
            routeSettings: RouteSettings(name: 'LoggingIn'),
          );
        }
        if (state is AccountError) {
          if (loadingKey.currentContext != null)
            Navigator.of(loadingKey.currentContext!).pop();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: ListTile(
              leading: Icon(Icons.error_rounded),
              title: Text(state.errMsg ?? 'An Error Occurred'),
              contentPadding: EdgeInsets.zero,
              horizontalTitleGap: 0,
              iconColor: Colors.white,
              textColor: Colors.white,
            ),
            duration: Duration(seconds: 2),
          ));
        }
        if (state is AccountLoggedIn) {
          //  context.read<AccountBloc>().add(LoadUserProfileEvent());
          Navigator.of(context).popUntil((route) {
            print(route.settings.name);
            return route.settings.name == '/primary';
          });
        }
      },
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: BlocBuilder<AccountBloc, AccountState>(
          buildWhen: (previous, current) {
            print('Account Previous: $previous');
            print('Account Current: $current');
            return current is AccountInitial || current is AccountLoggedIn;
          },
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AccountHeader(
                  photoUrl:
                      state is AccountLoggedIn ? state.user!.photoUrl : null,
                ),
                state is AccountLoggedIn
                    ? AccountContent(
                        user: state.user,
                      )
                    : LoginContent(),
                SizedBox(height: 25),
                FollowUsFooter(),
                SizedBox(height: kToolbarHeight),
              ],
            );
          },
        ),
      ),
    );
  }
}
