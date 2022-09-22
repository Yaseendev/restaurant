import 'package:flavor/flavor_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:restaurant_app/User/blocs/account_bloc/account_bloc.dart';
import 'package:restaurant_app/User/data/models/user.dart';
import 'package:restaurant_app/utils/constants.dart';
import '../screen/edit_account_screen.dart';
import 'account_form_card.dart';

class AccountContent extends StatelessWidget {
  final User? user;
  const AccountContent({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${user!.name.first} ${user!.name.last}',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 6),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.email_outlined,
                  color: AppColors.PRIMARY_COLOR,
                ),
                SizedBox(width: 6),
                Text(user!.email),
              ],
            ),
          ],
        ),
        SizedBox(height: 25),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: AccountFormCard(
                icon: Icons.favorite_border_outlined,
                color: Color(0xFF00A2D7),
                title: 'Favorite',
                count: 24,
                subtitle: 'ITEMS',
              ),
            ),
            Expanded(
              child: AccountFormCard(
                color: Color(0xFFE6242E),
                icon: Icons.wallet_outlined,
                title: 'Wallet',
                count: 73,
                subtitle: 'EGP',
              ),
            ),
          ],
        ),
        SizedBox(height: 25),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: TextButton.icon(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                    return EditAccountScreen(
                      user: user!,
                    );
                  }));
                },
                icon: Icon(
                  FontAwesomeIcons.penToSquare,
                  color: Colors.black,
                ),
                label: Text(
                  'Edit Account',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                style: ButtonStyle(alignment: Alignment.topLeft),
              ),
            ),
            Divider(
              color: Colors.grey,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: TextButton.icon(
                onPressed: () {},
                icon: Icon(
                  Icons.share_outlined,
                  color: Colors.black,
                ),
                label: Text(
                  'Share App',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                style: ButtonStyle(alignment: Alignment.topLeft),
              ),
            ),
            Divider(
              color: Colors.grey,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: TextButton.icon(
                onPressed: () {},
                icon: Icon(
                  Icons.perm_phone_msg_outlined,
                  color: Colors.black,
                ),
                label: Text(
                  'Contact Us',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                style: ButtonStyle(alignment: Alignment.topLeft),
              ),
            ),
            Divider(),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: TextButton.icon(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            content: Text('Are you sure you want to sign out?'),
                            actions: [
                              TextButton(
                                child: Text('Cancel'),
                                onPressed: () => Navigator.of(ctx).pop(false),
                              ),
                              TextButton(
                                child: Text('Log out'),
                                onPressed: () => Navigator.of(ctx).pop(true),
                              ),
                            ],
                          )).then((value) {
                    if (value != null) {
                      if (value)
                        context.read<AccountBloc>().add(LogoutUserEvent());
                    }
                  });
                },
                icon: Icon(
                  Icons.power_settings_new_rounded,
                  color: Colors.red,
                ),
                label: Text(
                  'Logout',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.red,
                  ),
                ),
                style: ButtonStyle(alignment: Alignment.topLeft),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
