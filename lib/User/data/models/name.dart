import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'name.g.dart';

@HiveType(typeId: 1)
class Name extends Equatable {
  @HiveField(0)
  String first;

  @HiveField(1)
  String last;

  Name({
    required this.first,
    required this.last,
  });

  factory Name.fromString(String name) {
    final splitedName = name.split(' ');
    String _firstName;
    String _lastName;
    try {
      _firstName = name.isEmpty ? '' : splitedName[0];
    } catch (e) {
      _firstName = '';
    }

    try {
      _lastName = name.isEmpty
          ? ''
          : splitedName.getRange(1, splitedName.length).reduce((a, b) => a + b);
    } catch (e) {
      _lastName = '';
    }

    return Name(
      first: _firstName,
      last: _lastName,
    );
  }
  
  @override
  List<Object?> get props => [first, last];
}
