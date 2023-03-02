// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'charger_status_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChargerStatusEntity _$ChargerStatusEntityFromJson(Map<String, dynamic> json) =>
    ChargerStatusEntity(
      x: json['x'] as int,
      available: (json['Available'] as num?)?.toDouble() ?? 0.0,
      occupied: (json['Occupied'] as num?)?.toDouble() ?? 0.0,
      outOfService: (json['OutOfService'] as num?)?.toDouble() ?? 0.0,
      reserved: (json['Reserved'] as num?)?.toDouble() ?? 0.0,
      unknown: (json['Unknown'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$ChargerStatusEntityToJson(
        ChargerStatusEntity instance) =>
    <String, dynamic>{
      'x': instance.x,
      'Available': instance.available,
      'Occupied': instance.occupied,
      'OutOfService': instance.outOfService,
      'Reserved': instance.reserved,
      'Unknown': instance.unknown,
    };
