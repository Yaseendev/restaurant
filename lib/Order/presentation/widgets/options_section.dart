import 'package:flutter/material.dart';
import 'package:restaurant_app/Product/data/models/product_option.dart';
import 'extra_option_tile.dart';

class OptionsSection extends StatefulWidget {
  final List<ProductOption> options;
  final Function(List<ProductOption> selectedOptions) onUpdate;
  const OptionsSection({
    Key? key,
    required this.options,
    required this.onUpdate,
  }) : super(key: key);

  @override
  State<OptionsSection> createState() => _OptionsSectionState();
}

class _OptionsSectionState extends State<OptionsSection> {
  Set<ProductOption> totalOptions = Set<ProductOption>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text.rich(
            TextSpan(
              text: 'Extra Options ',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              children: [
                TextSpan(
                    text: '(Optional)',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    )),
              ],
            ),
          ),
          SizedBox(height: 12),
          ...widget.options.map((option) => ExtraOptionTile(
            optionName: option.name,
            price: option.price,
            onUpdate: (selected) {
              selected ? totalOptions.add(option) : totalOptions.remove(option);
              widget.onUpdate(totalOptions.toList());
            },
          ),),
          
          // ExtraOptionTile(
          //   optionName: 'Extra Tomato',
          //   price: 8,
          //   onUpdate: (selected) {
          //     selected ? totalOptions += 8 : totalOptions -= 8;
          //     widget.onUpdate(totalOptions);
          //   },
          // ),
          // ExtraOptionTile(
          //   optionName: 'Add More Meat',
          //   price: 20,
          //   onUpdate: (selected) {
          //     selected ? totalOptions += 20 : totalOptions -= 20;
          //     widget.onUpdate(totalOptions);
          //   },
          // ),
        ],
      ),
    );
  }
}
