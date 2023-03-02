import 'package:json_annotation/json_annotation.dart';

part 'charger_status_entity.g.dart';

@JsonSerializable()
class ChargerStatusEntity {
  final int x;
  @JsonKey(name: 'Available', defaultValue: 0.0)
  final double available;
  @JsonKey(name: 'Occupied', defaultValue: 0.0)
  final double occupied;
  @JsonKey(name: 'OutOfService', defaultValue: 0.0)
  final double outOfService;
  @JsonKey(name: 'Reserved', defaultValue: 0.0)
  final double reserved;
  @JsonKey(name: 'Unknown', defaultValue: 0.0)
  final double unknown;

  ChargerStatusEntity({
    required this.x,
    required this.available,
    required this.occupied,
    required this.outOfService,
    required this.reserved,
    required this.unknown,
  });

  factory ChargerStatusEntity.fromJson(Map<String, dynamic> json) =>
      _$ChargerStatusEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ChargerStatusEntityToJson(this);
}
