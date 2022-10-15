import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:restaurant_app/Shared/blocs/cubit/cart_cubit.dart';
import 'package:restaurant_app/Shared/presentation/widgets/custom_app_bar.dart';
import 'package:restaurant_app/utils/constants.dart';
import '../widgets/paywith_listview.dart';
import '../widgets/pickup_options_listview.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  PickupOption pickupOption = PickupOption.delivery;
  PaymentMethod selectedMethod = PaymentMethod.cash;
  @override
  Widget build(BuildContext context) {
    final order = context.read<CartCubit>().state;
    return Scaffold(
      appBar: CustomAppBar.appBarWithBackBttn(context, 'checkout'),
      body: ListView(
        padding: EdgeInsets.all(12),
        children: [
          Text(
            'Pickup Option',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          PickupOptionsListView(
            onSelect: (opt) {
              setState(() {
                pickupOption = opt!;
              });
            },
          ),
          pickupOption == PickupOption.takeaway
              ? Container()
              : Column(
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .16,
                            child: GoogleMap(
                              initialCameraPosition: CameraPosition(
                                target: LatLng(30.0504132, 31.2073222),
                                zoom: 18,
                              ),
                              liteModeEnabled: true,
                            ),
                          ),
                          ListTile(
                            leading: Icon(Icons.person_pin_circle_outlined),
                            title: Text('Location name'),
                            subtitle: Text('Address details'),
                            trailing: TextButton(
                              child: Text('Change'),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: ListTile(
                        leading: Icon(
                          FontAwesomeIcons.truckFast,
                          color: Colors.black,
                        ),
                        title: Text('Within 23 mins'),
                      ),
                    ),
                  ],
                ),
          SizedBox(height: 18),
          Text(
            'Pay with',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          PaywithListView(
            onSelect: (method) {
              setState(() {
                selectedMethod = method;
              });
            },
          ),
          SizedBox(height: 18),
          Text(
            'Payment Summary',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Sub-total',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      '${order.fold(0, (num previousValue, element) => previousValue + element.totalPrice)} EGP',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Fees',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      '4.99 EGP',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      '${order.fold(0, (num previousValue, element) => previousValue + element.totalPrice) + 4.99} EGP',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
                      ),
                      child: Text(
                        'Place Order',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


//TODO: Implement Checkout screen