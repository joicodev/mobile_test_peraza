import 'dart:ui';

/// An enumeration representing the load states of a loader.
///
/// Each state has a code, a name, and an associated color.
enum ChargerStatusEnum {
  /// Code 1, name "Available", color light green.
  available(1, 'Disponible', Color(0xFFbdfcd2)),

  /// Code 2, name "Busy", color dark orange.
  occupied(2, 'Ocupado', Color(0xFFff5722)),

  /// Code 3, name "Out of Service", color dark blue.
  outOfService(3, 'Fuera de\nservicio', Color(0xFF094bfc)),

  /// Code 4, name "Reserved", color light yellow.
  reserved(4, 'Reservado', Color(0xFFfff0cc)),

  /// Code 5, name "Unknown", color dark gray.
  unknown(5, 'Desconocido', Color(0xFF848484)),
  ;

  final int code;
  final String name;
  final Color color;

  const ChargerStatusEnum(this.code, this.name, this.color);

  /// Returns the name of the state associated with the supplied code.
  static String nameByCode(int code) {
    return byCode(code).name;
  }

  /// Returns the color of the state associated with the supplied code.
  static Color colorByCode(int code) {
    return byCode(code).color;
  }

  /// Returns the status associated with the supplied code.
  /// If no state exists with the supplied code, the unknown state is returned.
  static ChargerStatusEnum byCode(int code) {
    try {
      return ChargerStatusEnum.values.firstWhere((e) => e.code == code);
    } catch (_) {
      return ChargerStatusEnum.unknown;
    }
  }
}
