// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'charger_status_statistics_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChargerStatusStatisticsRequest _$ChargerStatusStatisticsRequestFromJson(
        Map<String, dynamic> json) =>
    ChargerStatusStatisticsRequest(
      outletId: json['outlet_id'] as int,
      filter: json['filter'] as String,
      dayOfWeek: json['day_of_week'] as int,
    );

Map<String, dynamic> _$ChargerStatusStatisticsRequestToJson(
        ChargerStatusStatisticsRequest instance) =>
    <String, dynamic>{
      'outlet_id': instance.outletId,
      'filter': instance.filter,
      'day_of_week': instance.dayOfWeek,
    };
