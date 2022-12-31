import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:restaurant_app/utils/constants.dart';

part 'product_category.g.dart';

@HiveType(typeId: 6)
class ProductCategory extends Equatable {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final String imageUrl;

  ProductCategory({
    required this.id,
    required this.name,
    this.description = '',
    this.imageUrl = '',
  });

  factory ProductCategory.fromJson(Map<String, dynamic> json) {
    return ProductCategory(
      id: json['id'],
      name: json['name'],
      description: json['description'] ?? '',
      imageUrl: Urls.DOMAIN + '/' + (json['image'] ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['image'] = this.imageUrl;

    return data;
  }

  @override
  List<Object?> get props => [id, name, description, imageUrl];
}
