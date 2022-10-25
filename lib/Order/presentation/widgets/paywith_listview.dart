import 'package:flutter/material.dart';
//import 'package:flutter_stripe/flutter_stripe.dart' as StripeLib;
import 'package:restaurant_app/utils/constants.dart';

class PaywithListView extends StatefulWidget {
  final Function(PaymentMethod method) onSelect;
  const PaywithListView({
    super.key,
    required this.onSelect,
  });

  @override
  State<PaywithListView> createState() => _PaywithListViewState();
}

class _PaywithListViewState extends State<PaywithListView> {
  PaymentMethod selectedMethod = PaymentMethod.cash;

  @override
  Widget build(BuildContext context) {
    return ListBody(
      children: [
        Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          elevation: 2,
          child: RadioListTile<PaymentMethod>(
            title: ListTile(
              contentPadding: EdgeInsets.zero,
              horizontalTitleGap: 5,
              leading: Icon(
                Icons.credit_card_outlined,
                color: Colors.black,
              ),
              title: Text(
                'Credit Card',
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
            ),
            value: PaymentMethod.creditCard,
            groupValue: selectedMethod,
            onChanged: (val) async {
              showModalBottomSheet(
                context: context,
                enableDrag: true,
                isScrollControlled: true,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                )),
                builder: (context) {
                  return Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    //shrinkWrap: true,
                    children: [
                      ListTile(
                        leading: Icon(Icons.credit_card),
                        title: Text(
                          'Credit Card Info',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Divider(),
                      // StripeLib.CardFormField(
                      //   style: StripeLib.CardFormStyle(
                      //     textColor: Colors.black,
                      //     placeholderColor: Colors.black,
                      //   ),
                      //   controller: StripeLib.CardFormEditController(),
                      // ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            style: ElevatedButton.styleFrom(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            child: Text(
                              'Save Card',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).viewInsets.bottom,
                      ),
                    ],
                  );
                },
              );
              // await StripeLib.Stripe.instance.initPaymentSheet(
              //     paymentSheetParameters: StripeLib.SetupPaymentSheetParameters(
              //   style: ThemeMode.dark,
              // ));
              // StripeLib.Stripe.instance.presentPaymentSheet();
              // final paymentMethod = await StripeLib.Stripe.instance
              //     .createPaymentMethod(StripeLib.PaymentMethodParams.card(
              //         paymentMethodData: StripeLib.PaymentMethodData()));

              // setState(() {
              //   selectedMethod = val!;
              // });
              // widget.onSelect(val!);
            },
          ),
        ),
        Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: RadioListTile<PaymentMethod>(
            title: ListTile(
              contentPadding: EdgeInsets.zero,
              horizontalTitleGap: 5,
              leading: Icon(
                Icons.payments_outlined,
                color: Colors.black,
              ),
              title: Text(
                'Cash',
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
            ),
            value: PaymentMethod.cash,
            groupValue: selectedMethod,
            onChanged: (val) {
              setState(() {
                selectedMethod = val!;
              });
              widget.onSelect(val!);
            },
          ),
        ),
      ],
    );
  }
}
