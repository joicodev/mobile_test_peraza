import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_test_peraza/src/app.dart';

void main() {
  // The Flutter application is executed by wrapping the MyApp widget in a
  // `ProviderScope` of flutter_riverpod, which is used for dependency injection.
  runApp(const ProviderScope(child: MyApp()));
}
