import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'address_location.g.dart';

@HiveType(typeId: 2)
class AddressLocation extends Equatable {
  @HiveField(0)
  final LatLng position;

  @HiveField(1)
  final String name;

  AddressLocation({
    required this.position,
    required this.name,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "name": this.name,
      "position": this.position.toJson(),
    };
  }

  factory AddressLocation.fromJson(Map<String, dynamic> jsonObj) {
    return AddressLocation(
      position: LatLng.fromJson(jsonObj['position'])!,
      name: jsonObj['name'],
    );
  }

  @override
  List<Object> get props => [position, name];
}
