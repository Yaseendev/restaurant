import 'package:equatable/equatable.dart';

class ProductOption extends Equatable{
  final String name;
  final num price;

  ProductOption({
    required this.name,
    required this.price,
  });
  
  @override
  List<Object> get props => [name, price];
}
