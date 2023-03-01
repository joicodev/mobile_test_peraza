import 'package:flutter/material.dart';
import 'package:mobile_test_peraza/src/features/charger/presentation/pages/charger_statistics_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF094bfc),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(backgroundColor: Color(0xFF094bfc)),
      ),
      home: const ChargerStatisticsPage(),
    );
  }
}
