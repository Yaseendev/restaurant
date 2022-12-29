import 'package:equatable/equatable.dart';
import 'package:restaurant_app/Product/data/models/product.dart';
import 'package:restaurant_app/Product/data/models/product_option.dart';

class OrderItem extends Equatable {
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

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      product: Product(
        id: json['id'],
        name: json['title'] ?? '',
        price: json['price'],
        imgUrl: json['img'] ?? '',
        categories: [],
      ),
      quantity: json['qty'],
      totalPrice: json['total'],
    );
  }

  @override
  List<Object?> get props => [product, size, options];
}
