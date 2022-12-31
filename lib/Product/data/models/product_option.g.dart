// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_option.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductOptionAdapter extends TypeAdapter<ProductOption> {
  @override
  final int typeId = 5;

  @override
  ProductOption read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductOption(
      id: fields[0] as int?,
      parentId: fields[1] as int?,
      name: fields[2] as String,
      price: fields[3] as num,
    );
  }

  @override
  void write(BinaryWriter writer, ProductOption obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.parentId)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.price);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductOptionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
