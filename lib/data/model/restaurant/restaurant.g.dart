// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Restaurant _$RestaurantFromJson(Map<String, dynamic> json) {
  return Restaurant(
    id: json['id'] as String?,
    name: json['name'] as String?,
    address: json['address'] as String?,
    description: json['description'] as String?,
    city: json['city'] as String?,
    remarks: json['remarks'] as String?,
  );
}

Map<String, dynamic> _$RestaurantToJson(Restaurant instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'description': instance.description,
      'city': instance.city,
      'remarks': instance.remarks,
    };
