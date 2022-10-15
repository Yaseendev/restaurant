import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/footer_action_button.dart';
import '../widgets/restaurant_rate_card.dart';
import '../widgets/restaurant_rating.dart';
import '../widgets/review_write_section.dart';

class AddRateScreen extends StatefulWidget {
  const AddRateScreen({Key? key}) : super(key: key);

  @override
  State<AddRateScreen> createState() => _AddRateScreenState();
}

class _AddRateScreenState extends State<AddRateScreen> {
  double serviceRate = 0;
  double staffRate = 0;
  double placeRate = 0;
  String reviewNotes = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.appBarWithBackBttn(context, 'Add Rate'),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 16),
              children: [
                Text(
                  'SUBMIT YOUR REVIEW FOR',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 18),
                RestaurantRateCard(),
                SizedBox(height: 28),
                RestaurantRating(
                  onRateUpdate: (service, staff, place) {
                    serviceRate = service;
                    staffRate = staff;
                    placeRate = place;
                  },
                ),
                SizedBox(height: 50),
                ReviewWriteSection(
                  onWrite: (notes) => reviewNotes = notes,
                ),
              ],
            ),
          ),
          FooterActionButton(
            text: 'Confirm',
            onPress: () {},
          ),
        ],
      ),
    );
  }
}
