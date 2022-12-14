import 'pivot.dart';

class ProductCategory {
  final int id;
  final String name;
  final String description;
  final String imageUrl;
  final Pivot? pivot;

  ProductCategory({
    required this.id,
    required this.name,
    this.description = '',
    this.imageUrl = '',
    required this.pivot,
  });

  factory ProductCategory.fromJson(Map<String, dynamic> json) {
    return ProductCategory(
        id: json['id'],
        name: json['name'],
        description: json['description'] ?? '',
        imageUrl: json['image'] ?? '',
        pivot: json['pivot'] != null ? Pivot.fromJson(json['pivot']) : null);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['image'] = this.imageUrl;
    if (this.pivot != null) {
      data['pivot'] = this.pivot!.toJson();
    }
    return data;
  }
}
