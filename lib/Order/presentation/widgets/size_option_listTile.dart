import 'package:flutter/material.dart';
import 'package:restaurant_app/utils/constants.dart';

class SizeOptionTile extends StatelessWidget {
  final num price;
  final String optionName;
  final ProductSize option;
  final ProductSize? groupValue;
  final Function(ProductSize? value) onUpate;
  const SizeOptionTile({
    Key? key,
    required this.onUpate,
    required this.option,
    required this.optionName,
    required this.price,
    required this.groupValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: RadioListTile<ProductSize>(
        dense: true,
        title: Text.rich(
          TextSpan(
            text: '$price ',
            children: [
              TextSpan(
                  text: 'EGP',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                  )),
            ],
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.grey,
            ),
          ),
          textDirection: TextDirection.ltr,
          textAlign: TextAlign.end,
        ),
        contentPadding: EdgeInsets.zero,
        secondary: Text(
          optionName,
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        value: option,
        groupValue: groupValue,
        onChanged: onUpate,
      ),
    );
  }
}
