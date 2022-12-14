// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_location.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AddressLocationAdapter extends TypeAdapter<AddressLocation> {
  @override
  final int typeId = 2;

  @override
  AddressLocation read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AddressLocation(
      position: fields[0] as LatLng,
      name: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AddressLocation obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.position)
      ..writeByte(1)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AddressLocationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
