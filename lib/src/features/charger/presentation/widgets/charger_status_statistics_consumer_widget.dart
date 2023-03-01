import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_test_peraza/src/features/charger/domain/entities/charger_status_entity.dart';
import 'package:mobile_test_peraza/src/features/charger/presentation/providers/charger_status_provider.dart';
import 'package:mobile_test_peraza/src/features/charger/presentation/widgets/chart/charger_status_mrx_chart_widget.dart';
import 'package:mobile_test_peraza/src/features/common/presentation/widgets/common_widgets.dart';
import 'package:mrx_charts/mrx_charts.dart';

class ChargerStatusStatisticsConsumerWidget extends ConsumerWidget {
  final int hours;
  const ChargerStatusStatisticsConsumerWidget(
    this.hours, {
    Key? key,
  }) : super(key: key);

  ChartBarDataItem _buildChartData({
    required double i,
    required BuildContext context,
    required ChargerStatusEntity data,
  }) {
    double val = 0.0;
    switch (i.toInt()) {
      case 1:
        val = data.available;
        break;
      case 2:
        val = data.occupied;
        break;
      case 3:
        val = data.outOfService;
        break;
      case 4:
        val = data.reserved;
        break;
      case 5:
        val = data.unknown;
        break;
    }

    return ChartBarDataItem(
      x: i,
      value: val,
      color: Theme.of(context).primaryColor,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(chargerNotifierProvider);
    return state.when(
      error: (error, _) => Center(
        child: CommonWidgets.buildLottieAsset(
          context,
          'assets/lottie/error.json',
          '¡Oops, hemos tenido un error inesperado!\n$error',
        ),
      ),
      loading: () => Center(
        child: CommonWidgets.buildLottieAsset(
          context,
          'assets/lottie/loading.json',
          'Cargando...',
        ),
      ),
      data: (data) {
        return Center(
          child: InkWell(
            child: ChargerStatusMrxChartWidget(
              List.generate(
                5,
                (index) => _buildChartData(
                  i: index + 1,
                  context: context,
                  data: data[hours],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
