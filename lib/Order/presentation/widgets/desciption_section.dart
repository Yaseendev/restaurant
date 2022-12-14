import 'package:flavor/flavor_colors.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/Product/data/models/product.dart';
import 'package:restaurant_app/utils/constants.dart';

class DescriptionSection extends StatefulWidget {
  final Product item;
  final Function(int value) onUpdate;
  const DescriptionSection({
    Key? key,
    required this.item,
    required this.onUpdate,
  }) : super(key: key);

  @override
  State<DescriptionSection> createState() => _DescriptionSectionState();
}

class _DescriptionSectionState extends State<DescriptionSection> {
  int ammount = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            widget.item.name,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            //'A simply delicious grilled 100% beef patty with onions, pickles, mustard and a dollop',
            widget.item.desc,
            strutStyle: StrutStyle(height: 1.6),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 4.0,
            left: 14,
            right: 14,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Price on selection',
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.PRIMARY_COLOR,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        // Text.rich(TextSpan(
                        //   text: '${widget.item.price}',
                        //   style: TextStyle(
                        //     color: Colors.grey,
                        //     fontWeight: FontWeight.bold,
                        //     decoration: TextDecoration.lineThrough,
                        //   ),
                        //   children: [
                        //     TextSpan(
                        //       text: ' EGP',
                        //       style: TextStyle(
                        //         fontWeight: FontWeight.normal,
                        //         fontSize: 12,
                        //       ),
                        //     ),
                        //   ],
                        // )),
                        //SizedBox(width: 15),
                        Text.rich(TextSpan(
                          text: '${widget.item.price}',//'75.25',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                          children: [
                            TextSpan(
                              text: ' EGP',
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        )),
                      ],
                    ),
                  ),
                  SizedBox(width: 40),
                  Expanded(
                    child: Card(
                      margin: EdgeInsets.only(bottom: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      elevation: 4,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(
                              onPressed: ammount == 1
                                  ? null
                                  : () {
                                      if (ammount > 1) {
                                        setState(() {
                                          --ammount;
                                        });
                                        widget.onUpdate(ammount);
                                      }
                                    },
                              icon: Icon(Icons.minimize_rounded),
                              alignment: Alignment.center,
                              padding: const EdgeInsets.only(bottom: 16),
                              color: AppColors.PRIMARY_COLOR,
                              iconSize: 30,
                              disabledColor: Color(0xFFF5A7AB),
                            ),
                            Expanded(
                              child: Text(
                                '$ammount',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  ++ammount;
                                });
                                widget.onUpdate(ammount);
                              },
                              icon: Icon(Icons.add),
                              alignment: Alignment.center,
                              //padding:const EdgeInsets.symmetric(vertical: 6),
                              color: AppColors.PRIMARY_COLOR,
                              iconSize: 30,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
