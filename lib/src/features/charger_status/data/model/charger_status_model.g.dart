// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'charger_status_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChargerStatusModel _$ChargerStatusModelFromJson(Map<String, dynamic> json) =>
    ChargerStatusModel(
      x: json['x'] as int,
      available: (json['Available'] as num).toDouble(),
      occupied: (json['Occupied'] as num).toDouble(),
      outOfService: (json['OutOfService'] as num).toDouble(),
      reserved: (json['Reserved'] as num).toDouble(),
      unknown: (json['Unknown'] as num).toDouble(),
    );

Map<String, dynamic> _$ChargerStatusModelToJson(ChargerStatusModel instance) =>
    <String, dynamic>{
      'x': instance.x,
      'Available': instance.available,
      'Occupied': instance.occupied,
      'OutOfService': instance.outOfService,
      'Reserved': instance.reserved,
      'Unknown': instance.unknown,
    };
