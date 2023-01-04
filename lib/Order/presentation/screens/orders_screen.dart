import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app/User/blocs/account_bloc/account_bloc.dart';
import 'package:restaurant_app/utils/constants.dart';

import '../widgets/order_card.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountBloc, AccountState>(
      builder: (context, state) {
        if (state is AccountLoggedIn || state is AccountUpdated)
          return LayoutBuilder(builder: (context, constrains) {
            return constrains.maxWidth < 500
                ? ListView(
                    shrinkWrap: true,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    children: [
                      OrderCard(),
                      OrderCard(),
                      OrderCard(),
                      OrderCard(),
                      OrderCard(),
                      OrderCard(),
                      OrderCard(),
                    ],
                  )
                : SingleChildScrollView(
                    child: Wrap(
                      alignment: WrapAlignment.spaceEvenly,
                      // shrinkWrap: true,
                      // padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      children: [
                        OrderCard(),
                        OrderCard(),
                        OrderCard(),
                        OrderCard(),
                        OrderCard(),
                        OrderCard(),
                        OrderCard(),
                      ],
                    ),
                  );
          });
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                Images.SIGNEDOUT,
                //width: 100,
                fit: BoxFit.fill,
              ),
            ),
            const Text(
              'You Are Not Logged In\nSign in to see your orders',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        );
      },
    );
  }
}
