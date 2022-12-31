import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'product_option.g.dart';

@HiveType(typeId: 5)
class ProductOption extends Equatable {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final int? parentId;
  @HiveField(2)
  final String name;
  @HiveField(3)
  final num price;

  ProductOption({
    this.id,
    this.parentId,
    required this.name,
    required this.price,
  });

  factory ProductOption.fromJson(Map<String, dynamic> json) {
    return ProductOption(
      id: json['id'],
      parentId: json['parent_id'],
      name: json['title'] ?? '',
      price: json['price'],
    );
  }

  @override
  List<Object?> get props => [id, parentId, name, price];
}
