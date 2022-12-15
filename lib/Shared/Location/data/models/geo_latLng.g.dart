// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geo_latLng.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GeoLatLngAdapter extends TypeAdapter<GeoLatLng> {
  @override
  final int typeId = 3;

  @override
  GeoLatLng read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GeoLatLng(
      latitude: fields[0] as double,
      longitude: fields[1] as double,
    );
  }

  @override
  void write(BinaryWriter writer, GeoLatLng obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.latitude)
      ..writeByte(1)
      ..write(obj.longitude);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GeoLatLngAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
