import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:restaurant_app/Category/data/models/product_category.dart';
import 'package:restaurant_app/utils/constants.dart';
import 'product_option.dart';

part 'product.g.dart';

@HiveType(typeId: 4)
class Product extends Equatable {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String desc;
  @HiveField(3)
  final num price;
  @HiveField(4)
  final num? discount;
  @HiveField(5)
  final String imgUrl;
  @HiveField(6)
  final num? likes;
  @HiveField(7)
  final List<ProductOption>? sizes;
  @HiveField(8)
  final List<ProductOption>? options;
  @HiveField(9)
  late num finalPrice;
  @HiveField(10)
  final List<ProductCategory> categories;
  @HiveField(11)
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
