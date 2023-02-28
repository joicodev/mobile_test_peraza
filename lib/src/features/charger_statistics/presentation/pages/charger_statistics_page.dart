import 'package:flutter/material.dart';

class ChargerStatisticsPage extends StatefulWidget {
  const ChargerStatisticsPage({Key? key}) : super(key: key);

  @override
  State<ChargerStatisticsPage> createState() => _ChargerStatisticsPageState();
}

class _ChargerStatisticsPageState extends State<ChargerStatisticsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Charger Statistics'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text('Hello world!...'),
        ],
      ),
    );
  }
}
