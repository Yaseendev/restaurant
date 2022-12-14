import 'product_option.dart';

class Product {
  final String name;
  final String desc;
  final num price;
  final num? discount;
  final String imgUrl;
  final num likes;
  final List<ProductOption>? sizes;
  final List<ProductOption>? options;
  late num finalPrice;

  Product({
    required this.name,
    required this.desc,
    required this.price,
    this.discount,
    required this.sizes,
    required this.options,
    required this.imgUrl,
    required this.likes,
  }) {
    finalPrice = getFinalPrice();
  }

  num getFinalPrice() {
    return price - (discount ?? 0);
  }
}
