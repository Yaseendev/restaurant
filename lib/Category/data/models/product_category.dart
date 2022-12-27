import 'package:equatable/equatable.dart';
import 'package:restaurant_app/utils/constants.dart';

class ProductCategory extends Equatable{
  final int id;
  final String name;
  final String description;
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
        imageUrl: Urls.DOMAIN +'/'+ json['image'],);
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
  List<Object?> get props => [
    id,
    name,
    description,
    imageUrl
  ];
}
