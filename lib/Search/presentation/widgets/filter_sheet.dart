import 'package:flutter/material.dart';
import 'package:restaurant_app/Category/data/models/product_category.dart';

class FilterSheet extends StatefulWidget {
  final List<ProductCategory> categories;
  final num? startPrice;
  final num? endPrice;
  final List<String>? selectedCategories;
  final Function(
      num? startPrice, num? endPrice, List<String> selectedCategories) onApply;
  final VoidCallback onClear;
  const FilterSheet({
    required this.startPrice,
    required this.endPrice,
    required this.selectedCategories,
    super.key,
    required this.categories,
    required this.onApply,
    required this.onClear,
  });

  @override
  State<FilterSheet> createState() => _FilterSheetState();
}

class _FilterSheetState extends State<FilterSheet> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  num? startPrice;
  num? endPrice;
  Set<String>? selectedCategories = Set<String>();

  @override
  void initState() {
    startPrice = widget.startPrice;
    endPrice = widget.endPrice;
    selectedCategories = widget.selectedCategories != null
        ? widget.selectedCategories!.toSet()
        : Set<String>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
        top: Radius.circular(20),
      )),
      onClosing: () {},
      builder: (context) {
        return Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.only(
                top: 16,
                right: 16,
                left: 16,
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Fillter results',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Divider(),
                const SizedBox(height: 6),
                ListView(
                  shrinkWrap: true,
                  children: [
                    Text(
                      'Price Range',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 40,
                          width: 120,
                          child: TextFormField(
                            textAlign: TextAlign.center,
                            textAlignVertical: TextAlignVertical.center,
                            decoration:
                                InputDecoration(border: OutlineInputBorder()),
                            textInputAction: TextInputAction.next,
                            initialValue:
                                startPrice != null ? '$startPrice' : null,
                            validator: (val) {
                              if (val != null) {
                                if (val.isNotEmpty &&
                                    double.tryParse(val) == null)
                                  return 'Invalid Value';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.number,
                            onChanged: (value) =>
                                startPrice = double.tryParse(value),
                          ),
                        ),
                        Text(
                          '-',
                          style: TextStyle(
                            fontSize: 28,
                          ),
                        ),
                        SizedBox(
                            height: 40,
                            width: 120,
                            child: TextFormField(
                              textAlign: TextAlign.center,
                              decoration:
                                  InputDecoration(border: OutlineInputBorder()),
                              initialValue:
                                  endPrice != null ? '$endPrice' : null,
                              validator: (val) {
                                if (val != null) {
                                  if (val.isNotEmpty &&
                                      double.tryParse(val) == null)
                                    return 'Invalid Value';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.number,
                              onChanged: (value) =>
                                  endPrice = double.tryParse(value),
                            )),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Divider(),
                    const Text(
                      'Categories',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 12),
                    Wrap(
                      alignment: WrapAlignment.spaceBetween,
                      children: List.generate(
                          widget.categories.length,
                          (index) => Padding(
                                padding: const EdgeInsets.all(4),
                                child: FilterChip(
                                  label: Text(widget.categories[index].name),
                                  selected: selectedCategories!
                                      .contains(widget.categories[index].name),
                                  //selectedCategoriesFlags[index],
                                  onSelected: (value) {
                                    print(value);
                                    setState(() => value
                                        ? selectedCategories!
                                            .add(widget.categories[index].name)
                                        : selectedCategories!.remove(
                                            widget.categories[index].name));
                                    print(selectedCategories);
                                  },
                                ),
                              )),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: OutlinedButton(
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.all(12),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                textStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              onPressed: () {
                                widget.onClear();
                              },
                              child: Text('Clear'),
                            ),
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.all(12),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                textStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  widget.onApply(startPrice, endPrice,
                                      selectedCategories!.toList());
                                }
                              },
                              child: Text('Apply'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
