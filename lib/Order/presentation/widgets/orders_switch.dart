import 'package:flutter/material.dart';
import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';

class OrdersSwitch extends StatelessWidget {
  final dynamic initialValue;
  final Map<Object, Widget> segments;
  final Function(Object value) onChange;
  const OrdersSwitch({
    Key? key,
    required this.initialValue,
    required this.onChange,
    required this.segments,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 14),
      child: CustomSlidingSegmentedControl(
        initialValue: initialValue,
        isStretch: true,
        innerPadding: const EdgeInsets.all(8),
        children: segments,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(32),
          border: Border.all(color: Colors.grey),
        ),
        thumbDecoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(100),
        ),
        onValueChanged: onChange,
      ),
    );
  }
}
