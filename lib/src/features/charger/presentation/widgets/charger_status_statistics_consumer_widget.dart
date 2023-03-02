import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_test_peraza/src/features/charger/presentation/providers/charger_status_provider.dart';
import 'package:mobile_test_peraza/src/features/charger/presentation/widgets/charger_status_mrx_chart_widget.dart';
import 'package:mobile_test_peraza/src/features/common/presentation/widgets/common_widgets.dart';

/// This widget is responsible for displaying the charger status statistics,
/// it receives the selected hour as a parameter.
class ChargerStatusStatisticsConsumerWidget extends ConsumerWidget {
  // Constructor
  const ChargerStatusStatisticsConsumerWidget(this.hourSelected, {Key? key})
      : super(key: key);

  // The selected hour to filter the charger status data
  final int hourSelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Get the current state of the `chargerNotifierProvider` using `ref.watch`
    final state = ref.watch(chargerNotifierProvider);

    // Return different widgets depending on the state of the `chargerNotifierProvider`
    return state.when(
      // When the state is data, return the `ChargerStatusMrxChartWidget` passing the data and selected hour
      data: (data) => ChargerStatusMrxChartWidget(data, hourSelected),

      // When the state is loading, return a loading animation using `CommonWidgets.buildLottieAsset`
      loading: () => Center(
        child: CommonWidgets.buildLottieAsset(
          context,
          'assets/lottie/loading.json',
          'Cargando...',
        ),
      ),

      // When the state is error, return an error animation using `CommonWidgets.buildLottieAsset`
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
