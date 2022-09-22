import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
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

  User({
    this.id,
    required this.name,
    required this.email,
    this.phoneNumber,
    this.gender,
    this.photoUrl,
  });

  User.fromJson(Map<String, dynamic> parsedJson)
      : id = parsedJson['id'] ?? '',
        name = Name.fromString(parsedJson['name']),
        email = parsedJson['email'] ?? '',
        gender = parsedJson['gender'] ?? '';
  //photoUrl = parsedJson['picture']['data']['url'];

  Map<String, dynamic> toJson([String? password]) {
    final userMap = <String, dynamic>{
      "name": this.name.first, //TODO: Change to full
      "email": this.email,
      "phone": this.phoneNumber,
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
      ];
}
