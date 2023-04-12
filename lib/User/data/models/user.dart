import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:restaurant_app/Product/data/models/product.dart';
import 'name.dart';

  part 'user.g.dart';

  @HiveType(typeId: 0)
  class User extends Equatable {
  @HiveField(0)
  int? id;

  @HiveField(1)
  Name name;

  @HiveField(2)
  String email;

  @HiveField(3)
  String? phoneNumber;

  @HiveField(4)
  String? gender;

  @HiveField(5)
  String? photoUrl;

  @HiveField(6)
  final List<Product> favorites;

  User({
    this.id,
    required this.name,
    required this.email,
    this.phoneNumber,
    this.gender,
    this.photoUrl,
    this.favorites = const <Product>[],
  });

  User.fromJson(Map<String, dynamic> parsedJson)
      : id = parsedJson['id'] ?? '',
        name = Name(
          first: parsedJson['first_name'],
          last: parsedJson['last_name'],
        ),
        phoneNumber = parsedJson['phone'],
        email = parsedJson['email'] ?? '',
        gender = parsedJson['gender'] ?? '',
        favorites = <Product>[]; //TODO: implement from the backend
  //photoUrl = parsedJson['picture']['data']['url'];

  Map<String, dynamic> toJson([String? password]) {
    final userMap = <String, dynamic>{
      "first_name": this.name.first,
      "last_name": this.name.last,
      "email": this.email,
      "phone": this.phoneNumber,
      "gender": this.gender,
    };
    if (password != null) {
      userMap.addEntries([
        MapEntry('password', password),
      ]);
    }

    return userMap;
  }

  @override
  List<Object?> get props => [
        id,
        name,
        email,
        phoneNumber,
        gender,
        photoUrl,
        favorites,
      ];
}
