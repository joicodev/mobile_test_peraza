import 'package:json_annotation/json_annotation.dart';

part 'charger_status_statistics_request.g.dart';

// We indicate that this class can be serialized and deserialized from JSON.
@JsonSerializable()
class ChargerStatusStatisticsRequest {
  // The ID of the charger outlet for which you want to obtain statistics
  @JsonKey(name: 'outlet_id')
  final int outletId;

  // The desired statistics filter (example: "day_of_week")
  @JsonKey(name: 'filter')
  final String filter;

  // The day of the week for which you want to obtain statistics (7 for Sunday, 1 for Monday, etc.)
  @JsonKey(name: 'day_of_week')
  final int dayOfWeek;

  // Constructor of the class that receives the values of the fields as parameters.
  ChargerStatusStatisticsRequest({
    required this.outletId,
    required this.filter,
    required this.dayOfWeek,
  });

  // Factory method to create an instance of the class from a JSON.
  factory ChargerStatusStatisticsRequest.fromJson(Map<String, dynamic> json) =>
      _$ChargerStatusStatisticsRequestFromJson(json);

  // Method to serialize the class to JSON.
  Map<String, dynamic> toJson() => _$ChargerStatusStatisticsRequestToJson(this);
}
