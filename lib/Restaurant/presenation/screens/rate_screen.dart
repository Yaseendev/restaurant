import 'package:flutter/material.dart';
import 'package:restaurant_app/Shared/Rate/presentation/screens/add_rate_screen.dart';
import 'package:restaurant_app/Shared/Rate/presentation/widgets/custom_app_bar.dart';
import 'package:restaurant_app/Shared/Rate/presentation/widgets/footer_action_button.dart';
import '../widgets/rate_card.dart';

class RateScreen extends StatelessWidget {
  const RateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.appBarWithBackBttn(context, 'Rate'),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                RateCard(),
                RateCard(),
                RateCard(),
              ],
            ),
          ),
          FooterActionButton(
            onPress: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => AddRateScreen()));
            },
            text: 'Add Rate',
          ),
        ],
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton:
    );
  }
}
