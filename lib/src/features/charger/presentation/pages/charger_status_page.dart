import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mobile_test_peraza/src/features/charger/presentation/widgets/charger_status_statistics_consumer_widget.dart';
import 'package:mobile_test_peraza/src/features/charger/presentation/widgets/chart/charger_status_fl_chart_widget.dart';
import 'package:mobile_test_peraza/src/features/charger/presentation/widgets/chart/charger_status_mrx_chart_widget.dart';
import 'package:mrx_charts/mrx_charts.dart';

class ChargerStatusPage extends StatefulWidget {
  const ChargerStatusPage({Key? key}) : super(key: key);

  @override
  State<ChargerStatusPage> createState() => _ChargerStatusPageState();
}

enum TypeChart { mrxChart, flChart }

class _ChargerStatusPageState extends State<ChargerStatusPage> {
  TypeChart? _character = TypeChart.mrxChart;

  Widget _buildOptionsChart(String title, TypeChart value) {
    return ListTile(
      title: Text(title, style: const TextStyle(color: Colors.white)),
      leading: Radio<TypeChart>(
        value: value,
        groupValue: _character,
        onChanged: (TypeChart? value) {
          setState(() => _character = value);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Charger Statistics'),
      ),
      backgroundColor: const Color(0xFF1B0E41),
      body: Column(
        children: const [
          ChargerStatusStatisticsConsumerWidget(),
          /* Row(
            children: [
              Flexible(
                child: _buildOptionsChart('Mrx Chart', TypeChart.mrxChart),
              ),
              Flexible(
                child: _buildOptionsChart('Fl Chart', TypeChart.flChart),
              ),
            ],
          ),
          _character == TypeChart.mrxChart
              ? ChargerStatusMrxChartWidget(
                  List.generate(
                    5,
                    (index) => ChartBarDataItem(
                      color: const Color(0xFF8043F9),
                      value: Random().nextInt(100) + 1,
                      x: index.toDouble() + 1,
                    ),
                  ),
                )
              : ChargerStatusFlChartWidget()*/
        ],
      ),
    );
  }
}
