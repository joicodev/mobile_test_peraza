import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_test_peraza/src/features/charger/presentation/providers/charger_status_provider.dart';
import 'package:mobile_test_peraza/src/features/charger/presentation/widgets/charger_status_statistics_consumer_widget.dart';
import 'package:mobile_test_peraza/src/features/common/extensions/widget_extension.dart';
import 'package:mobile_test_peraza/src/features/common/presentation/widgets/common_widgets.dart';
import 'package:mobile_test_peraza/src/features/common/presentation/widgets/dropdown_button_hide_underline.dart';
import 'package:mobile_test_peraza/src/features/common/resources/app_colors.dart';
import 'package:mobile_test_peraza/src/features/common/resources/custom_text_style.dart';

class ChargerStatisticsPage extends StatefulWidget {
  const ChargerStatisticsPage({Key? key}) : super(key: key);

  @override
  State<ChargerStatisticsPage> createState() => _ChargerStatisticsPageState();
}

enum TypeChart { mrxChart, flChart }

class _ChargerStatisticsPageState extends State<ChargerStatisticsPage> {
  TypeChart? _character = TypeChart.mrxChart;
  int? _selectWeekDay;
  int? _selectHours;

  final _itemsSelectWeekDay = [
    const MenuItem(text: 'Lunes', value: 1),
    const MenuItem(text: 'Martes', value: 2),
    const MenuItem(text: 'Miércoles', value: 3),
    const MenuItem(text: 'Jueves', value: 4),
    const MenuItem(text: 'Viernes', value: 5),
    const MenuItem(text: 'Sábado', value: 6),
    const MenuItem(text: 'Domingo', value: 7),
  ];

  final _itemsSelectHours = List.generate(
    24,
    (index) => MenuItem(
      text: 'Hora ${index + 1}',
      value: index + 1,
    ),
  );

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
    print("[ChargerStatisticsPage] - build");
    return Scaffold(
      appBar: AppBar(title: const Text("Evsy's charger statistics")),
      //backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.filter_alt_outlined,
                  size: 32,
                  color: AppColors.primary,
                ),
                Text('Filter by', style: CustomTextStyle.paragraphBold()),
              ],
            ),
            Consumer(
              builder: (context, ref, _) {
                print(
                    'LOADING???? ${ref.watch(chargerNotifierProvider).isLoading}');
                return Row(
                  children: [
                    AppDropdownButtonHideUnderline(
                      hint: 'Seleccionar día',
                      selectedValue: _selectWeekDay,
                      items: _itemsSelectWeekDay,
                      onChanged: (Object? value) {
                        setState(() => _selectWeekDay = value as int?);
                      },
                    ),
                    if (_selectWeekDay != null)
                      AppDropdownButtonHideUnderline(
                        hint: 'Seleccionar hora',
                        selectedValue: _selectHours,
                        items: _itemsSelectHours,
                        onChanged: (Object? value) {
                          setState(() => _selectHours = value as int?);
                        },
                      ),
                  ],
                ).paddingSymmetric(vertical: 10);
              },
            ),
            if (_selectWeekDay == null)
              CommonWidgets.buildLottieAsset(
                context,
                'assets/lottie/car_charger.json',
              )
            else
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
      ),
    );
  }
}
