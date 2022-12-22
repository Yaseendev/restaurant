import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'geo_latLng.g.dart';

@HiveType(typeId: 3)
class GeoLatLng extends Equatable {
  @HiveField(0)
  final double latitude;

  @HiveField(1)
  final double longitude;

  GeoLatLng({
    required this.latitude,
    required this.longitude,
  });

  static GeoLatLng? fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GeoLatLng(
      latitude: double.tryParse( json['lat'].toString()) ?? double.parse(json['latitude'].toString()),
      longitude: double.tryParse(json['lng'].toString()) ?? double.tryParse(json['longitude'].toString()) ?? double.tryParse(json['lon'].toString()) ?? double.parse(json['long'].toString()),
    );
  }

  static GeoLatLng? fromLatLng(LatLng? location) {
    if (location == null) {
      return null;
    }

    return GeoLatLng(
      latitude: location.latitude,
      longitude: location.longitude,
    );
  }

  static GeoLatLng fromPosition(Position position) {

    return GeoLatLng(
      latitude: position.latitude,
      longitude: position.longitude,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "latitude": this.latitude,
      "longitude": this.longitude,
    };
  }

  LatLng toLatLng() => LatLng(this.latitude, this.longitude);

  @override
  List<Object?> get props => [latitude, longitude];
}
