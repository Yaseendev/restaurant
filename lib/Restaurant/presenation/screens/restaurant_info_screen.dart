import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restaurant_app/Shared/widgets/custom_app_bar.dart';
import 'package:restaurant_app/Shared/widgets/restaurant_rate_card.dart';
import '../widgets/branches_listView.dart';

class RestauantInfoScreen extends StatelessWidget {
  const RestauantInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: CustomAppBar.appBarWithBackBttn(context, 'info'),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              children: [
                RestaurantRateCard(
                  withRating: true,
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.schedule_outlined,
                          size: 30,
                        ),
                        SizedBox(width: 4),
                        Text(
                          'Opening Hours',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Text('10:00 am - 02:00 am'),
                  ],
                ),
                SizedBox(height: 15),
                Divider(),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      size: 30,
                    ),
                    SizedBox(width: 4),
                    Text(
                      'Branches',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                BranchesListView(),
                SizedBox(height: 12),
                Divider(),
                Row(
                  children: [
                    Icon(
                      Icons.wallet_outlined,
                      size: 30,
                    ),
                    SizedBox(width: 4),
                    Text(
                      'Payment Options',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: SvgPicture.asset(
                    'assets/images/visa.svg',
                    alignment: Alignment.centerLeft,
                    semanticsLabel: 'Visa Logo',
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
