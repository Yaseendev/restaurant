// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AddressAdapter extends TypeAdapter<Address> {
  @override
  final int typeId = 2;

  @override
  Address read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Address(
      position: fields[0] as GeoLatLng?,
      name: fields[1] as String,
      road: fields[2] as String,
      neighbourhood: fields[3] as String,
      suburb: fields[4] as String,
      state: fields[5] as String,
      postcode: fields[6] as String,
      country: fields[7] as String,
      countryCode: fields[8] as String,
      town: fields[9] as String,
      title: fields[10] as String,
      city: fields[11] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Address obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.position)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.road)
      ..writeByte(3)
      ..write(obj.neighbourhood)
      ..writeByte(4)
      ..write(obj.suburb)
      ..writeByte(5)
      ..write(obj.state)
      ..writeByte(6)
      ..write(obj.postcode)
      ..writeByte(7)
      ..write(obj.country)
      ..writeByte(8)
      ..write(obj.countryCode)
      ..writeByte(9)
      ..write(obj.town)
      ..writeByte(10)
      ..write(obj.title)
      ..writeByte(11)
      ..write(obj.city);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AddressAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
