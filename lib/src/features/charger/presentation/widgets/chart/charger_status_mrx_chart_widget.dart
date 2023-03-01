import 'package:flutter/material.dart';
import 'package:mobile_test_peraza/src/features/common/resources/custom_text_style.dart';
import 'package:mrx_charts/mrx_charts.dart';

class ChargerStatusMrxChartWidget extends StatelessWidget {
  final List<ChartBarDataItem> items;
  const ChargerStatusMrxChartWidget(this.items, {Key? key}) : super(key: key);

  String _getStatusName(int status) {
    switch (status) {
      case 1:
        return "Available";
      case 2:
        return "Busy";
      case 3:
        return 'Out of\nservice';
      case 4:
        return "Reserved";
      default:
        return "Unknown";
    }
  }

  List<ChartLayer> _layers() {
    return [
      ChartAxisLayer(
        labelY: (value) => value.toInt().toString(),
        labelX: (value) => _getStatusName(value.toInt()),
        settings: ChartAxisSettings(
          x: ChartAxisSettingsAxis(
            min: 1,
            max: 5,
            frequency: 1.0,
            textStyle: CustomTextStyle.captionTextStyle(),
          ),
          y: ChartAxisSettingsAxis(
            min: 0.0,
            max: 100.0,
            frequency: 10.0,
            textStyle: CustomTextStyle.captionTextStyle(),
          ),
        ),
      ),
      ChartBarLayer(
        items: items,
        settings: const ChartBarSettings(
          thickness: 8.0,
          radius: BorderRadius.all(Radius.circular(4.0)),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Container(
          constraints: const BoxConstraints(
            maxHeight: 400.0,
            maxWidth: 600.0,
          ),
          padding: const EdgeInsets.all(24.0),
          child: Chart(
            layers: _layers(),
            padding: const EdgeInsets.symmetric(
              horizontal: 12.0,
            ).copyWith(bottom: 12.0),
          ),
        ),
      ),
    );
  }
}
