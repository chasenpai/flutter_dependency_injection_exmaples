// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StoreImpl _$$StoreImplFromJson(Map<String, dynamic> json) => _$StoreImpl(
      name: json['name'] as String,
      address: json['address'] as String,
      distance: json['distance'] as String,
      remainStatus: json['remainStatus'] as String,
    );

Map<String, dynamic> _$$StoreImplToJson(_$StoreImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'address': instance.address,
      'distance': instance.distance,
      'remainStatus': instance.remainStatus,
    };
