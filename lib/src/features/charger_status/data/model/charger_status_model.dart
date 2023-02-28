import 'package:freezed_annotation/freezed_annotation.dart';

part 'charger_status_model.g.dart';

@JsonSerializable()
class ChargerStatusModel {
  final int x;
  @JsonKey(name: 'Available')
  final double available;
  @JsonKey(name: 'Occupied')
  final double occupied;
  @JsonKey(name: 'OutOfService')
  final double outOfService;
  @JsonKey(name: 'Reserved')
  final double reserved;
  @JsonKey(name: 'Unknown')
  final double unknown;

  ChargerStatusModel({
    required this.x,
    required this.available,
    required this.occupied,
    required this.outOfService,
    required this.reserved,
    required this.unknown,
  });

  factory ChargerStatusModel.fromJson(Map<String, dynamic> json) =>
      _$ChargerStatusModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChargerStatusModelToJson(this);
}
