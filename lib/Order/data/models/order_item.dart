import 'package:restaurant_app/Product/data/models/product.dart';
import 'package:restaurant_app/Product/data/models/product_option.dart';

class OrderItem {
  final Product product;
  final ProductOption? size;
  final List<ProductOption>? options;
  num totalPrice;
  int quantity;

  OrderItem({
    required this.product,
    required this.quantity,
    this.size,
    this.options,
    required this.totalPrice,
  });
}
