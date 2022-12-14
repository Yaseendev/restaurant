import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class Branch {
  final int id;
  final String name;
  final String address;
  final LatLng? location;

  Branch({
    required this.id,
    required this.name,
    required this.address,
    required this.location,
  });

  factory Branch.fromJson(Map<String, dynamic>? json) {
    return Branch(
        id: json?['id'] ?? '',
        name: json?['name']?? '',
        address: json?['address'] ?? '',
        location: LatLng.fromJson(jsonEncode(json)));
  }

  // TODO: Implement update method
  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['name'] = this.name;
  //   data['address'] = this.address;
  //   data['lat'] = this.lat;
  //   data['lng'] = this.lng;
  //   data['created_at'] = this.createdAt;
  //   data['updated_at'] = this.updatedAt;
  //   data['deleted_at'] = this.deletedAt;
  //   return data;
  // }
}
