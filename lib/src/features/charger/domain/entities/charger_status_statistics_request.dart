import 'package:json_annotation/json_annotation.dart';

part 'charger_status_statistics_request.g.dart';

@JsonSerializable()
class ChargerStatusStatisticsRequest {
  @JsonKey(name: 'outlet_id')
  final int outletId;
  @JsonKey(name: 'filter')
  final String filter;
  @JsonKey(name: 'day_of_week')
  final int dayOfWeek;

  ChargerStatusStatisticsRequest({
    required this.outletId,
    required this.filter,
    required this.dayOfWeek,
  });

  factory ChargerStatusStatisticsRequest.fromJson(Map<String, dynamic> json) =>
      _$ChargerStatusStatisticsRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ChargerStatusStatisticsRequestToJson(this);
}
