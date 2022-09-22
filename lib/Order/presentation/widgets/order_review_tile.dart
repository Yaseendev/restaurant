import 'package:flavor/flavor_colors.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/utils/constants.dart';

class OrderReviewCard extends StatefulWidget {
  const OrderReviewCard({Key? key}) : super(key: key);

  @override
  State<OrderReviewCard> createState() => _OrderReviewCardState();
}

class _OrderReviewCardState extends State<OrderReviewCard> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 6),
      title: Text(
        'Beef Burger',
        style: TextStyle(fontSize: 18),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(height: 8),
          Text('Large, Extra Onion, Add more meat'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text.rich(TextSpan(
                text: '75.25',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: ' EGP',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 13,
                    ),
                  ),
                ],
              )),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: quantity == 1
                        ? null
                        : () {
                            if (quantity > 1) {
                              setState(() {
                                --quantity;
                              });
                              // widget.onUpdate(ammount);
                            }
                          },
                    icon: Icon(Icons.minimize_rounded),
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(bottom: 16),
                    color: AppColors.PRIMARY_COLOR,
                    iconSize: 30,
                    disabledColor: Color(0xFFF5A7AB),
                  ),
                  Text(
                    '$quantity',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        ++quantity;
                      });
                      // widget.onUpdate(ammount);
                    },
                    icon: Icon(Icons.add),
                    alignment: Alignment.center,
                    //padding:const EdgeInsets.symmetric(vertical: 6),
                    color: AppColors.PRIMARY_COLOR,
                    iconSize: 30,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      isThreeLine: true,
      trailing: Image.asset('assets/images/burger.png'),
    );
  }
}
