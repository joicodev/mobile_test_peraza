import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_test_peraza/src/features/charger/presentation/providers/charger_status_provider.dart';
import 'package:mobile_test_peraza/src/features/charger/presentation/widgets/chart/charger_status_mrx_chart_widget.dart';
import 'package:mrx_charts/mrx_charts.dart';

class ChargerStatusStatisticsConsumerWidget extends ConsumerWidget {
  final int selectWeekDay;
  const ChargerStatusStatisticsConsumerWidget(
    this.selectWeekDay, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(chargerNotifierProvider);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        state.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, _) => Text(error.toString()),
          data: (data) => Center(
            child: InkWell(
              child: ChargerStatusMrxChartWidget(
                List.generate(
                  5,
                  (index) => ChartBarDataItem(
                    color: const Color(0xFF8043F9),
                    value: Random().nextInt(100) + 1,
                    x: index.toDouble() + 1,
                  ),
                ),
              ),
            ),
          ),
        ),
        Center(
          child: ElevatedButton(
            onPressed: !state.isLoading
                ? () => ref
                    .read(chargerNotifierProvider.notifier)
                    .getStatistics(selectWeekDay)
                : null,
            child: const Text('Press me to get a give'),
          ),
        ),
      ],
    );
  }
}
