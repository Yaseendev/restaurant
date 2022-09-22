import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app/User/blocs/account_bloc/account_bloc.dart';
import '../screen/login_screen.dart';

class LoginContent extends StatelessWidget {
  const LoginContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: TextButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  settings: RouteSettings(name: 'login route'),
                  builder: (_) => LoginPage()));
            },
            child: Text(
              'Login Now',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        SizedBox(height: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
          ],
        ),
      ],
    );
  }
}
