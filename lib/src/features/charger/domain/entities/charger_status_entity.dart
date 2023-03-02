import 'package:json_annotation/json_annotation.dart';

part 'charger_status_entity.g.dart';

// We indicate that this class can be serialized and deserialized from JSON.
@JsonSerializable()
class ChargerStatusEntity {
  // We define an integer type field called 'x', this represents each hour and its value goes from 0 to 23
  final int x;
  // We define the field of double type, which contains the value of the state called 'Available'.
  @JsonKey(name: 'Available', defaultValue: 0.0)
  final double available;
  // We define the field of double type, which contains the value of the state called 'Occupied'.
  @JsonKey(name: 'Occupied', defaultValue: 0.0)
  final double occupied;
  // We define the field of double type, which contains the value of the state called 'OutOfService'.
  @JsonKey(name: 'OutOfService', defaultValue: 0.0)
  final double outOfService;
  // We define the field of double type, which contains the value of the state called 'Reserved'.
  @JsonKey(name: 'Reserved', defaultValue: 0.0)
  final double reserved;
  // We define the field of double type, which contains the value of the state called 'Unknown'.
  @JsonKey(name: 'Unknown', defaultValue: 0.0)
  final double unknown;

  // Constructor of the class that receives the values of the fields as parameters.
  ChargerStatusEntity({
    required this.x,
    required this.available,
    required this.occupied,
    required this.outOfService,
    required this.reserved,
    required this.unknown,
  });

  // Factory method to create an instance of the class from a JSON.
  factory ChargerStatusEntity.fromJson(Map<String, dynamic> json) =>
      _$ChargerStatusEntityFromJson(json);

  // Method to serialize the class to JSON.
  Map<String, dynamic> toJson() => _$ChargerStatusEntityToJson(this);
}
