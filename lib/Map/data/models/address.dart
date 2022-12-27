import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:restaurant_app/Shared/Location/data/models/geo_latLng.dart';

part 'address.g.dart';

@HiveType(typeId: 2)
class Address extends Equatable {
  @HiveField(0)
  GeoLatLng? position;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String road;

  @HiveField(3)
  final String neighbourhood;

  @HiveField(4)
  final String suburb;

  @HiveField(5)
  final String state;

  @HiveField(6)
  final String postcode;

  @HiveField(7)
  final String country;

  @HiveField(8)
  final String countryCode;

  @HiveField(9)
  final String town;

  @HiveField(10)
  final String title;

  @HiveField(11)
  final String city;

  Address({
    this.position,
    this.name = '',
    this.road = '',
    this.neighbourhood = '',
    this.suburb = '',
    this.state = '',
    this.postcode = '',
    this.country = '',
    this.countryCode = '',
    this.town = '',
    required this.title,
    this.city = '',
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    final address = json['address'] ?? json;
    return Address(
      position: GeoLatLng.fromJson(json['position'] ?? json),
      name: address['name'] ?? '',
      road: address['road'] ?? '',
      neighbourhood: address['neighbourhood'] ?? '',
      suburb: address['suburb'] ?? '',
      state: address['state'] ?? '',
      postcode: address['postcode'] ?? '',
      country: address['country'] ?? '',
      countryCode: address['country_code'] ?? '',
      town: address['town'] ?? '',
      city: address['city'] ?? '',
      title: json['display_name'] ?? json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "position": this.position?.toJson(),
      "name": this.name,
      "road": this.road,
      "neighbourhood": this.neighbourhood,
      "suburb": this.suburb,
      "state": this.state,
      "postcode": this.postcode,
      "country": this.country,
      "country_code": this.countryCode,
      "town": this.town,
      "title" : this.title,
      "city" : this.city,
    };
  }

  @override
  List<Object?> get props => [
        name,
        road,
        neighbourhood,
        suburb,
        state,
        postcode,
        countryCode,
        country,
        city,
        town,
        title,
      ];
}
