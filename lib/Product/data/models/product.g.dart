// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductAdapter extends TypeAdapter<Product> {
  @override
  final int typeId = 4;

  @override
  Product read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Product(
      id: fields[0] as int?,
      name: fields[1] as String,
      desc: fields[2] as String,
      price: fields[3] as num,
      discount: fields[4] as num?,
      sizes: (fields[7] as List?)?.cast<ProductOption>(),
      options: (fields[8] as List?)?.cast<ProductOption>(),
      imgUrl: fields[5] as String,
      likes: fields[6] as num?,
      categories: (fields[10] as List).cast<ProductCategory>(),
      type: fields[11] as String?,
    )..finalPrice = fields[9] as num;
  }

  @override
  void write(BinaryWriter writer, Product obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.desc)
      ..writeByte(3)
      ..write(obj.price)
      ..writeByte(4)
      ..write(obj.discount)
      ..writeByte(5)
      ..write(obj.imgUrl)
      ..writeByte(6)
      ..write(obj.likes)
      ..writeByte(7)
      ..write(obj.sizes)
      ..writeByte(8)
      ..write(obj.options)
      ..writeByte(9)
      ..write(obj.finalPrice)
      ..writeByte(10)
      ..write(obj.categories)
      ..writeByte(11)
      ..write(obj.type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
