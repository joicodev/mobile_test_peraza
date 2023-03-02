import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_test_peraza/src/features/charger/presentation/providers/charger_status_provider.dart';
import 'package:mobile_test_peraza/src/features/charger/presentation/widgets/charger_status_mrx_chart_widget.dart';
import 'package:mobile_test_peraza/src/features/common/presentation/widgets/common_widgets.dart';

class ChargerStatusStatisticsConsumerWidget extends ConsumerWidget {
  // Constructor
  const ChargerStatusStatisticsConsumerWidget(this.hourSelected, {Key? key})
      : super(key: key);

  //
  final int hourSelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(chargerNotifierProvider);
    return state.when(
      data: (data) => ChargerStatusMrxChartWidget(data, hourSelected),
      loading: () => Center(
        child: CommonWidgets.buildLottieAsset(
          context,
          'assets/lottie/loading.json',
          'Cargando...',
        ),
      ),
      error: (error, _) => Center(
        child: CommonWidgets.buildLottieAsset(
          context,
          'assets/lottie/error.json',
          '¡Oops, hemos tenido un error inesperado!',
        ),
      ),
    );
  }
}
