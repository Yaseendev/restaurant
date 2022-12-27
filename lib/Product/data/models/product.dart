import 'package:equatable/equatable.dart';
import 'package:restaurant_app/Category/data/models/product_category.dart';
import 'package:restaurant_app/utils/constants.dart';
import 'product_option.dart';

// ignore: must_be_immutable
class Product extends Equatable {
  final int? id;
  final String name;
  final String desc;
  final num price;
  final num? discount;
  final String imgUrl;
  final num? likes;
  final List<ProductOption>? sizes;
  final List<ProductOption>? options;
  late final num finalPrice;
  final List<ProductCategory> categories;
  String? type;

  Product({
    this.id,
    required this.name,
    this.desc = '',
    required this.price,
    this.discount,
    this.sizes,
    this.options,
    required this.imgUrl,
    this.likes,
    required this.categories,
    this.type,
  }) {
    finalPrice = getFinalPrice();
  }

  num getFinalPrice() {
    return price - (discount ?? 0);
  }

  factory Product.fromJson(Map<String, dynamic> parsedJson) {
    return Product(
      id: parsedJson['id'] ?? '',
      name: parsedJson['title'] ?? '',
      desc: parsedJson['description'] ?? '',
      type: parsedJson['type'],
      price: parsedJson['price'],
      discount: parsedJson['sale_price'],
      imgUrl: Urls.DOMAIN + '/' + (parsedJson['image'] ?? ''),
      sizes: parsedJson['child'] != null
          ? parsedJson['child'].isEmpty
              ? <ProductOption>[]
              : parsedJson['child']
                  .map<ProductOption>((size) => ProductOption.fromJson(size))
                  .toList()
          : null,
      categories: parsedJson['category'].isEmpty
          ? <ProductCategory>[]
          : parsedJson['category']
              .map<ProductCategory>((cat) => ProductCategory.fromJson(cat))
              .toList(),
    );
  }

  @override
  List<Object?> get props => [id, name];
}
