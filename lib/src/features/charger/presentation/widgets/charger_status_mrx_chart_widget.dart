import 'package:flutter/material.dart';
import 'package:mobile_test_peraza/src/features/charger/domain/entities/charger_status_entity.dart';
import 'package:mobile_test_peraza/src/features/common/extensions/widget_extension.dart';
import 'package:mobile_test_peraza/src/features/common/resources/custom_text_style.dart';
import 'package:mrx_charts/mrx_charts.dart';

class ChargerStatusMrxChartWidget extends StatelessWidget {
  final int hourSelected;
  final List<ChargerStatusEntity> data;

  const ChargerStatusMrxChartWidget(
    this.data,
    this.hourSelected, {
    Key? key,
  }) : super(key: key);

  Color _colorByIndex(int index) {
    switch (index) {
      case 1:
        return const Color(0xFFbdfcd2);
      case 2:
        return const Color(0xFFff5722);
      case 3:
        return const Color(0xFF094bfc);
      case 4:
        return const Color(0xFFfff0cc);
      default:
        return const Color(0xFF848484);
    }
  }

  double _valueStatusByIndex(int index, ChargerStatusEntity data) {
    switch (index) {
      case 1:
        return data.available;
      case 2:
        return data.occupied;
      case 3:
        return data.outOfService;
      case 4:
        return data.reserved;
      default:
        return data.unknown;
    }
  }

  String _getStatusName(int status) {
    switch (status) {
      case 1:
        return "Disponible";
      case 2:
        return "Ocupado";
      case 3:
        return 'Fuera de\nservicio';
      case 4:
        return "Reservado";
      default:
        return "Desconocido";
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
            textStyle: CustomTextStyle.caption(),
          ),
          y: ChartAxisSettingsAxis(
            min: 0.0,
            max: 100.0,
            frequency: 5.0,
            textStyle: CustomTextStyle.caption(),
          ),
        ),
      ),
      ChartBarLayer(
        items: List.generate(
          5,
          (index) => ChartBarDataItem(
            x: index + 1,
            value: _valueStatusByIndex((index + 1).toInt(), data[hourSelected]),
            color: _colorByIndex((index + 1).toInt()),
          ),
        ),
        settings: const ChartBarSettings(
          thickness: 8.0,
          radius: BorderRadius.all(Radius.circular(4.0)),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          constraints: const BoxConstraints(
            maxHeight: 400.0,
            maxWidth: 600.0,
          ),
          child: Chart(
            layers: _layers(),
            padding: const EdgeInsets.symmetric(
              horizontal: 12.0,
            ).copyWith(bottom: 12.0),
          ),
        ),
        Flexible(
          child: ListView.separated(
            itemCount: 5,
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (context, index) {
              final name = _getStatusName(index + 1);
              final color = _colorByIndex(index + 1);
              final value = _valueStatusByIndex(index + 1, data[hourSelected]);
              return ListTile(
                dense: true,
                minLeadingWidth: 0,
                title: Text(
                  name,
                  style: CustomTextStyle.content(FontWeight.w400),
                ),
                trailing: Text(
                  '${value.toStringAsFixed(2)}%',
                  style: CustomTextStyle.content(),
                ),
                leading: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                  ),
                ),
              );
            },
          ).paddingTop(10),
        ),
      ],
    );
  }
}
