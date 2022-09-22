import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app/User/blocs/account_bloc/account_bloc.dart';
import '../widgets/account_content.dart';
import '../widgets/account_header.dart';
import '../widgets/followus_footer.dart';
import '../widgets/login_content.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: BlocListener<AccountBloc, AccountState>(
        listener: (context, state) {
          if (state is AccountLoggedIn) {
            Navigator.of(context).popUntil((route) {
              print(route.settings.name);
              return route.settings.name == '/primary';
            });
          } else if (state is AccountError) {
            showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                title: Text('Error'),
                content: Text('Error'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(ctx).pop(),
                    child: Text('Ok'),
                  ),
                ],
              ),
            );
          }
        },
        child: BlocBuilder<AccountBloc, AccountState>(
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
