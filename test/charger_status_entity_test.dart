import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_test_peraza/src/features/charger/domain/entities/charger_status_entity.dart';

void main() {
  // Groups the tests related to the ChargerStatusEntity entity.
  group('ChargerStatusEntity tests', () {
    // Test that checks the entity's fromJson function.
    test('fromJson creates a ChargerStatusEntity instance', () {
      // Creates a map with the values that are expected to serialize and deserialize successfully.
      final json = <String, dynamic>{
        'x': 10,
        'Available': 20.0,
        'Occupied': 30.0,
        'OutOfService': 40.0,
        'Reserved': 50.0,
        'Unknown': 60.0
      };

      // Creates an instance of the ChargerStatusEntity entity from the previously created map.
      final entity = ChargerStatusEntity.fromJson(json);

      // The isA<T>() function is used as a "matcher" in the assertion to check if the object is an instance
      // of the specified class, in this case, ChargerStatusEntity.
      expect(entity, isA<ChargerStatusEntity>());
      // Verifies that the value of `x` of the created entity is equal to 10.0.
      expect(entity.x, equals(10));
      // Verifies that the value of `available` of the created entity is equal to 20.0.
      expect(entity.available, equals(20.0));
      // Verifies that the value of `occupied` of the created entity is equal to 30.0.
      expect(entity.occupied, equals(30.0));
      // Verifies that the value of `outOfService` of the created entity is equal to 40.0.
      expect(entity.outOfService, equals(40.0));
      // Verifies that the value of `reserved` of the created entity is equal to 50.0
      expect(entity.reserved, equals(50.0));
      // Verifies that the value of `unknown` of the created entity is equal to 60.0
      expect(entity.unknown, equals(60.0));
    });

    // This unit test verifies that the ChargerStatusEntity class can be properly serialized to JSON.
    test('toJson returns a JSON map with correct values', () {
      // We create an instance of ChargerStatusEntity with some sample values for testing.
      final entity = ChargerStatusEntity(
        x: 10,
        available: 20.0,
        occupied: 30.0,
        outOfService: 40.0,
        reserved: 50.0,
        unknown: 60.0,
      );

      // We call the 'toJson' method of the entity to obtain a JSON map.
      final json = entity.toJson();

      // We verify that the returned JSON map is actually a Map<String, dynamic>.
      expect(json, isA<Map<String, dynamic>>());

      // We verify that the values in the returned JSON map match the values in the original entity.
      expect(json['x'], equals(10));
      expect(json['Available'], equals(20.0));
      expect(json['Occupied'], equals(30.0));
      expect(json['OutOfService'], equals(40.0));
      expect(json['Reserved'], equals(50.0));
      expect(json['Unknown'], equals(60.0));
    });
  });
}
