import 'package:flutter/material.dart';
import 'package:restaurant_app/Product/models/product_option.dart';
import 'package:restaurant_app/utils/constants.dart';

import 'size_option_listTile.dart';

class SizeListView extends StatefulWidget {
  final List<ProductOption> sizes;
  final Function(ProductOption selectedSize) onSelect;
  const SizeListView({
    Key? key,
    required this.sizes,
    required this.onSelect,
  }) : super(key: key);

  @override
  State<SizeListView> createState() => _SizeListViewState();
}

class _SizeListViewState extends State<SizeListView> {
  ProductOption? selectedSize;

  @override
  void initState() {
    selectedSize = widget.sizes.last; //TODO: change to first
    super.initState();
  }

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
          ...widget.sizes.map((size) => SizeOptionTile(
                optionName: size.name,
                groupValue: selectedSize,
                option: size,
                price: size.price,
                onUpate: (value) {
                  setState(() {
                    selectedSize = value;
                  });
                  widget.onSelect(selectedSize!);
                },
              )),
          // SizeOptionTile(
          //  optionName: 'Medium',
          //   groupValue: selectedSize,
          //   option: ProductSize.medium,
          //   price: 64,
          //   onUpate: (value) {
          //     setState(() {
          //       selectedSize = value;
          //     });
          //   },
          // ),
          // SizeOptionTile(
          //   optionName: 'Large',
          //   groupValue: selectedSize,
          //   option: ProductSize.large,
          //   price: 75.25,
          //   onUpate: (value) {
          //     setState(() {
          //       selectedSize = value;
          //     });
          //   },
          // ),
        ],
      ),
    );
  }
}
