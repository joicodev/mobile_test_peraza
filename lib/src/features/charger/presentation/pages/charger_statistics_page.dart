import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_test_peraza/src/features/charger/presentation/providers/charger_status_provider.dart';
import 'package:mobile_test_peraza/src/features/charger/presentation/widgets/charger_status_statistics_consumer_widget.dart';
import 'package:mobile_test_peraza/src/features/common/extensions/widget_extension.dart';
import 'package:mobile_test_peraza/src/features/common/presentation/widgets/common_widgets.dart';
import 'package:mobile_test_peraza/src/features/common/presentation/widgets/dropdown_button_hide_underline.dart';
import 'package:mobile_test_peraza/src/features/common/resources/custom_text_style.dart';

class ChargerStatisticsPage extends StatefulWidget {
  const ChargerStatisticsPage({Key? key}) : super(key: key);

  @override
  State<ChargerStatisticsPage> createState() => _ChargerStatisticsPageState();
}

class _ChargerStatisticsPageState extends State<ChargerStatisticsPage> {
  int? _selectWeekDay; // Saves the selected day in the filter.
  int _selectHours = 0; // Saves the selected time in the filter.

  // Contains the dropdown list items to select the day of the week.
  final _itemsSelectWeekDay = [
    const MenuItem(text: 'Lunes', value: 1),
    const MenuItem(text: 'Martes', value: 2),
    const MenuItem(text: 'Miércoles', value: 3),
    const MenuItem(text: 'Jueves', value: 4),
    const MenuItem(text: 'Viernes', value: 5),
    const MenuItem(text: 'Sábado', value: 6),
    const MenuItem(text: 'Domingo', value: 7),
  ];

  // Contains the dropdown list items for selecting the time of day.
  final _itemsSelectHours = List.generate(
    24,
    (index) => MenuItem(
      value: index,
      text: 'Hora ${index + 1}',
    ),
  );

  // This widget is the filter section, which includes two dropdown lists to select the day and time.
  Widget _boxFilter() {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              Icons.filter_alt_outlined,
              size: 30,
              color: Theme.of(context).primaryColor,
            ),
            Text('Filtrar por', style: CustomTextStyle.paragraphBold()),
            if (_selectWeekDay != null)
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    onPressed: () {
                      _selectWeekDay = null;
                      _selectHours = 0;
                      setState(() {});
                    },
                    padding: EdgeInsets.zero,
                    icon: const Icon(Icons.refresh_outlined),
                  ),
                ),
              )
          ],
        ),
        Consumer(
          builder: (context, ref, _) {
            // Gets the status of the provider.
            final state = ref.watch(chargerNotifierProvider);
            return Row(
              children: [
                AppDropdownButtonHideUnderline(
                  hint: 'Seleccionar día',
                  selectedValue: _selectWeekDay,
                  items: _itemsSelectWeekDay,
                  enabled: !state.isLoading,
                  onChanged: (Object? value) {
                    setState(() {
                      _selectHours = 0;
                      _selectWeekDay = value as int?;
                    });
                    final prov = ref.read(chargerNotifierProvider.notifier);
                    prov.getStatistics(_selectWeekDay!);
                  },
                ),
                // Displays the dropdown list if a day has been selected.
                if (_selectWeekDay != null &&
                    !state.hasError &&
                    !state.isLoading)
                  AppDropdownButtonHideUnderline(
                    hint: 'Seleccionar hora',
                    selectedValue: _selectHours,
                    items: _itemsSelectHours,
                    enabled: !state.isLoading,
                    onChanged: (Object? value) {
                      setState(() => _selectHours = (value as int?) ?? 1);
                    },
                  ),
              ],
            );
          },
        ).paddingSymmetric(vertical: 10),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Evsy's charger statistics")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Adds the _boxFilter() widget that returns a custom filter box.
          _boxFilter(),
          // If the _selectWeekDay variable is null, an animation is displayed using the buildLottieAsset() widget.
          if (_selectWeekDay == null)
            CommonWidgets.buildLottieAsset(
              context,
              'assets/lottie/car_charger.json',
            )
          else
            // If _selectWeekDay has a value, returns a Charger Status Statistics ConsumerWidget widget with the value of _selectHours as a parameter.
            Expanded(
              child: ChargerStatusStatisticsConsumerWidget(_selectHours),
            ),
        ],
      ).paddingAll(20),
    );
  }
}
