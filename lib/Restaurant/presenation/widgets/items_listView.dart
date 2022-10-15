import 'package:flavor/flavor_colors.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/Product/models/product.dart';
import 'package:restaurant_app/Product/models/product_option.dart';
import 'package:restaurant_app/utils/constants.dart';
import 'item_tile.dart';

class ItemsListView extends StatelessWidget {
  final String title;
  final List<Product> items;
  final Function(num order) onProductOrder;
  const ItemsListView({
    Key? key,
    required this.title,
    required this.items,
    required this.onProductOrder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: AppColors.PRIMARY_COLOR,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          ...ListTile.divideTiles(
            context: context,
            tiles: items.map((product) => ItemTile(item: product,)).toList(),
            /*[
              ItemTile(
                item: Product(
                  name: 'Beef Burger',
                  desc:
                      'A simply delicious grilled 100% beef patty with onions, pickles, mustard and a dollop',
                  imgUrl: 'assets/images/cover.png',
                  price: 90,
                  sizes: [
                    ProductOption(
                      name: 'Small',
                      price: 33,
                    ),
                    ProductOption(
                      name: 'Medium',
                      price: 64,
                    ),
                    ProductOption(
                      name: 'Large',
                      price: 75.25,
                    ),
                  ],
                  options: [
                    ProductOption(
                      name: 'Extra Onion',
                      price: 5,
                    ),
                    ProductOption(
                      name: 'Extra Tomato',
                      price: 8,
                    ),
                    ProductOption(
                      name: 'Add More Meat',
                      price: 20,
                    ),
                  ],
                  discount: 14.5,
                  likes: 2100,
                ),
                // onOrder: (val) {
                //   onProductOrder(val);
                // },
              ),
              ItemTile(
                item: Product(
                  name: 'Beef Burger',
                  desc:
                      'A simply delicious grilled 100% beef patty with onions, pickles, mustard and a dollop',
                  imgUrl: 'assets/images/burger.png',
                  price: 90,
                  discount: 14.5,
                  likes: 2100,
                  sizes: [
                    ProductOption(
                      name: 'Small',
                      price: 33,
                    ),
                    ProductOption(
                      name: 'Medium',
                      price: 64,
                    ),
                    ProductOption(
                      name: 'Large',
                      price: 75.25,
                    ),
                  ],
                  options: [
                    ProductOption(
                      name: 'Extra Onion',
                      price: 5,
                    ),
                    ProductOption(
                      name: 'Extra Tomato',
                      price: 8,
                    ),
                    ProductOption(
                      name: 'Add More Meat',
                      price: 20,
                    ),
                  ],
                ),
              ),
              ItemTile(
                item: Product(
                  name: 'Beef Burger',
                  desc:
                      'A simply delicious grilled 100% beef patty with onions, pickles, mustard and a dollop',
                  imgUrl: 'assets/images/burger.png',
                  price: 90,
                  discount: 14.5,
                  likes: 2100,
                  sizes: [
                    ProductOption(
                      name: 'Small',
                      price: 33,
                    ),
                    ProductOption(
                      name: 'Medium',
                      price: 64,
                    ),
                    ProductOption(
                      name: 'Large',
                      price: 75.25,
                    ),
                  ],
                  options: [
                    ProductOption(
                      name: 'Extra Onion',
                      price: 5,
                    ),
                    ProductOption(
                      name: 'Extra Tomato',
                      price: 8,
                    ),
                    ProductOption(
                      name: 'Add More Meat',
                      price: 20,
                    ),
                  ],
                ),
              ),
              ItemTile(
                item: Product(
                  name: 'Beef Burger',
                  desc:
                      'A simply delicious grilled 100% beef patty with onions, pickles, mustard and a dollop',
                  imgUrl: 'assets/images/burger.png',
                  price: 90,
                  discount: 14.5,
                  likes: 2100,
                  sizes: [
                    ProductOption(
                      name: 'Small',
                      price: 33,
                    ),
                    ProductOption(
                      name: 'Medium',
                      price: 64,
                    ),
                    ProductOption(
                      name: 'Large',
                      price: 75.25,
                    ),
                  ],
                  options: [
                    ProductOption(
                      name: 'Extra Onion',
                      price: 5,
                    ),
                    ProductOption(
                      name: 'Extra Tomato',
                      price: 8,
                    ),
                    ProductOption(
                      name: 'Add More Meat',
                      price: 20,
                    ),
                  ],
                ),
              ),
              ItemTile(
                item: Product(
                  name: 'Beef Burger',
                  desc:
                      'A simply delicious grilled 100% beef patty with onions, pickles, mustard and a dollop',
                  imgUrl: 'assets/images/burger.png',
                  price: 90,
                  discount: 14.5,
                  likes: 2100,
                  sizes: [
                    ProductOption(
                      name: 'Small',
                      price: 33,
                    ),
                    ProductOption(
                      name: 'Medium',
                      price: 64,
                    ),
                    ProductOption(
                      name: 'Large',
                      price: 75.25,
                    ),
                  ],
                  options: [
                    ProductOption(
                      name: 'Extra Onion',
                      price: 5,
                    ),
                    ProductOption(
                      name: 'Extra Tomato',
                      price: 8,
                    ),
                    ProductOption(
                      name: 'Add More Meat',
                      price: 20,
                    ),
                  ],
                ),
              ),
              ItemTile(
                item: Product(
                  name: 'Beef Burger',
                  desc:
                      'A simply delicious grilled 100% beef patty with onions, pickles, mustard and a dollop',
                  imgUrl: 'assets/images/burger.png',
                  price: 90,
                  discount: 14.5,
                  likes: 2100,
                  sizes: [
                    ProductOption(
                      name: 'Small',
                      price: 33,
                    ),
                    ProductOption(
                      name: 'Medium',
                      price: 64,
                    ),
                    ProductOption(
                      name: 'Large',
                      price: 75.25,
                    ),
                  ],
                  options: [
                    ProductOption(
                      name: 'Extra Onion',
                      price: 5,
                    ),
                    ProductOption(
                      name: 'Extra Tomato',
                      price: 8,
                    ),
                    ProductOption(
                      name: 'Add More Meat',
                      price: 20,
                    ),
                  ],
                ),
              ),
              //ItemTile(),
              //ItemTile(),
            ],*/
          ),
        ],
      ),
    );
  }
}
