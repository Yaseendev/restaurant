import 'package:equatable/equatable.dart';

class ProductOption extends Equatable {
  final int? id;
  final int? parentId;
  final String name;
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
