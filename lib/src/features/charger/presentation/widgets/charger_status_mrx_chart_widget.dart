import 'package:flutter/material.dart';
import 'package:mobile_test_peraza/src/features/charger/domain/entities/charger_status_entity.dart';
import 'package:mobile_test_peraza/src/features/charger/domain/enum/charger_status.dart';
import 'package:mobile_test_peraza/src/features/common/extensions/widget_extension.dart';
import 'package:mobile_test_peraza/src/features/common/resources/custom_text_style.dart';
import 'package:mrx_charts/mrx_charts.dart';

class ChargerStatusMrxChartWidget extends StatelessWidget {
  // hourSelected represents the selected hour in the filter.
  final int hourSelected;
  // data is a list of entities that holds the state of the charger.
  final List<ChargerStatusEntity> data;

  // This widget takes in two parameters: hourSelected and data.
  const ChargerStatusMrxChartWidget(
    this.data,
    this.hourSelected, {
    Key? key,
  }) : super(key: key);

  // receives two parameters: "index" which is an integer used to select a specific charge state,
  // and "data" which is an entity that stores the values of the charge states.
  //
  // The method returns a double value corresponding to the selected load state via the index
  // given in "index" and drawn from the "data" entity.
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

  // Returns a list of ChartLayer objects, which contain information for rendering the chart.
  List<ChartLayer> _layers() {
    return [
      // The ChartAxisLayer object defines the labels and settings for the x and y axis of the chart.
      ChartAxisLayer(
        // The labelY function is used to convert the y-axis values to strings.
        labelY: (value) => value.toInt().toString(),
        // The labelX function is used to get the status name by code from the ChargerStatusEnum
        labelX: (value) => ChargerStatusEnum.nameByCode(value.toInt()),
        // The ChartAxisSettings object contains the x and y axis settings, such as min and max values, frequency, and text style.
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
        // Creates the chart bars by generating ChartBarDataItem objects.
        items: List.generate(
          5,
          (index) => ChartBarDataItem(
            x: index + 1,
            value: _valueStatusByIndex((index + 1).toInt(), data[hourSelected]),
            color: ChargerStatusEnum.colorByCode((index + 1).toInt()),
          ),
        ),
        // The ChartBarSettings object contains settings for the thickness and border radius of the chart bars.
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
          // Maximum container size constraints
          constraints: const BoxConstraints(
            maxHeight: 400.0,
            maxWidth: 600.0,
          ),
          // Custom chart widget that shows upload information
          child: Chart(
            layers: _layers(),
            padding: const EdgeInsets.symmetric(
              horizontal: 12.0,
            ).copyWith(bottom: 12.0),
          ),
        ),
        Flexible(
          // A ListView that displays a list of items
          child: ListView.separated(
            itemCount: 5,
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (context, index) {
              // Get the load status based on the index
              final statusData = ChargerStatusEnum.byCode(index + 1);
              // Gets the value of the state of charge according to the index and the selected time
              final value = _valueStatusByIndex(index + 1, data[hourSelected]);
              return ListTile(
                dense: true,
                minLeadingWidth: 0,
                // The title of the ListTile is the name of the loading state
                title: Text(
                  statusData.name,
                  style: CustomTextStyle.content(FontWeight.w400),
                ),
                // The text at the end of the ListTile is the value of the load state
                trailing: Text(
                  '${value.toStringAsFixed(2)}%',
                  style: CustomTextStyle.content(),
                ),
                // The left container of the ListTile contains a circle with the color of the loading state
                leading: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: statusData.color,
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
