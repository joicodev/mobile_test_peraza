import 'package:flutter/material.dart';
import 'package:mobile_test_peraza/src/features/charger/presentation/widgets/charger_status_statistics_consumer_widget.dart';
import 'package:mobile_test_peraza/src/features/common/presentation/widgets/dropdown_button_hide_underline.dart';
import 'package:mobile_test_peraza/src/features/common/resources/app_colors.dart';
import 'package:mobile_test_peraza/src/features/common/resources/custom_text_style.dart';

class ChargerStatusPage extends StatefulWidget {
  const ChargerStatusPage({Key? key}) : super(key: key);

  @override
  State<ChargerStatusPage> createState() => _ChargerStatusPageState();
}

enum TypeChart { mrxChart, flChart }

class _ChargerStatusPageState extends State<ChargerStatusPage> {
  TypeChart? _character = TypeChart.mrxChart;
  int? _selectWeekDay;

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
      appBar: AppBar(title: const Text('Charger Statistics')),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            minLeadingWidth: 30,
            horizontalTitleGap: 0,
            leading: const Icon(
              Icons.filter_alt_outlined,
              size: 32,
              color: AppColors.primary,
            ),
            title: Text(
              'Filter by:',
              style: CustomTextStyle.paragraphRegular(),
            ),
          ),
          AppDropdownButtonHideUnderline(
            selectedValue: _selectWeekDay,
            items: const [
              MenuItem(text: 'Lunes', value: 1),
              MenuItem(text: 'Martes', value: 2),
              MenuItem(text: 'Miércoles', value: 3),
              MenuItem(text: 'Jueves', value: 4),
              MenuItem(text: 'Viernes', value: 5),
              MenuItem(text: 'Sábado', value: 6),
              MenuItem(text: 'Domingo', value: 7),
            ],
            onChanged: (Object? value) {
              setState(() => _selectWeekDay = value as int?);
            },
          ),
          ChargerStatusStatisticsConsumerWidget(_selectWeekDay ?? 0),
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
