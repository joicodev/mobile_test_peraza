import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_test_peraza/src/features/charger/presentation/providers/charger_status_provider.dart';

class ChargerStatusStatisticsConsumerWidget extends ConsumerWidget {
  const ChargerStatusStatisticsConsumerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(chargerNotifierProvider);
    return Column(
      children: [
        state.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, _) => Text(error.toString()),
          data: (data) => Center(
            child: InkWell(
              child: Text(
                'Esta es la data $data',
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Center(
          child: ElevatedButton(
            onPressed: !state.isLoading
                ? () =>
                    ref.read(chargerNotifierProvider.notifier).getStatistics()
                : null,
            child: const Text('Press me to get a give'),
          ),
        ),
      ],
    );
  }
}
