import 'package:flutter/material.dart';
import 'package:mrx_charts/mrx_charts.dart';

class ChargerStatusMrxChartWidget extends StatelessWidget {
  final List<ChartBarDataItem> items;
  const ChargerStatusMrxChartWidget(this.items, {Key? key}) : super(key: key);

  String _getStatusName(int status) {
    switch (status) {
      case 1:
        return "Disponible";
      case 2:
        return "Ocupado";
      case 3:
        return "Fuera de servicio";
      case 4:
        return "Reservado";
      default:
        return "Desconocido";
    }
  }

  List<ChartLayer> _layers() {
    return [
      ChartAxisLayer(
        settings: ChartAxisSettings(
          x: ChartAxisSettingsAxis(
            frequency: 1.0,
            min: 1,
            max: 5,
            textStyle: TextStyle(
              color: Colors.white.withOpacity(0.6),
              fontSize: 8.5,
            ),
          ),
          y: ChartAxisSettingsAxis(
            frequency: 10.0,
            max: 100.0,
            min: 0.0,
            textStyle: TextStyle(
              color: Colors.white.withOpacity(0.6),
              fontSize: 5.0,
            ),
          ),
        ),
        labelX: (value) => _getStatusName(value.toInt()),
        labelY: (value) => value.toInt().toString(),
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
