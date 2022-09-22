import 'package:flutter/material.dart';
import 'package:restaurant_app/utils/constants.dart';

import 'size_option_listTile.dart';

class SizeListView extends StatefulWidget {
  const SizeListView({Key? key}) : super(key: key);

  @override
  State<SizeListView> createState() => _SizeListViewState();
}

class _SizeListViewState extends State<SizeListView> {
  ProductSize? selectedSize = ProductSize.large;
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Choose Size',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 12),
          SizeOptionTile(
            optionName: 'Small',
            groupValue: selectedSize,
            option: ProductSize.small,
            price: 33,
            onUpate: (value) {
              setState(() {
                  selectedSize = value;
                });
            },
          ),
          SizeOptionTile(
            optionName: 'Medium',
            groupValue: selectedSize,
            option: ProductSize.medium,
            price: 64,
            onUpate: (value) {
              setState(() {
                  selectedSize = value;
                });
            },
          ),
          SizeOptionTile(
            optionName: 'Large',
            groupValue: selectedSize,
            option: ProductSize.large,
            price: 75.25,
            onUpate: (value) {
              setState(() {
                  selectedSize = value;
                });
            },
          ),
          
        ],
      ),
    );
  }
}
