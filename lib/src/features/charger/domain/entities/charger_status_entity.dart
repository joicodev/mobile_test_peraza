import 'package:json_annotation/json_annotation.dart';

part 'charger_status_entity.g.dart';

@JsonSerializable()
class ChargerStatusEntity {
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
