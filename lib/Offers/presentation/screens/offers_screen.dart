import 'package:flutter/material.dart';
import 'package:restaurant_app/Shared/widgets/custom_app_bar.dart';
import '../widgets/offer_card_large.dart';

class OffersScreen extends StatelessWidget {
  const OffersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.appBarWithBackBttn(context, 'Offers'),
      body: ListView(
        children: [
          OffercardLarge(),
          OffercardLarge(),
        ],
      ),
    );
  }
}
