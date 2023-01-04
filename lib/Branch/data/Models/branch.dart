import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:restaurant_app/Shared/Location/data/models/geo_latLng.dart';

class Branch {
  int? id;
  String? name;
  String? address;
  GeoLatLng? location;

  Branch({
    this.id,
    this.name,
    this.address,
    this.location,
  });

  factory Branch.fromJson(Map<String, dynamic>? json) {
    return Branch(
        id: json?['id'] ?? '',
        name: json?['name'] ?? '',
        address: json?['address'] ?? '',
        location: GeoLatLng.fromJson(json));
  }

  void update(Branch newBranch) {
    this.name = newBranch.name;
    this.id = newBranch.id;
    this.location = newBranch.location;
    this.address = newBranch.address;
  }

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
