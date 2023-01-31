import 'package:crypto_suggest/src/features/token/widgets/token_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/enums.dart';
import '../viewmodels/token_viewmodel.dart';

class GainersView extends StatelessWidget {
  const GainersView({
    required this.timeframe,
    Key? key,
  }) : super(key: key);
  final Timeframe timeframe;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer(
        builder: (context, ref, child) {
          final gainersProvider = ref.watch(
            gainersTokenVmProvider(timeframe),
          );
          return gainersProvider.when(
            data: (gainerList) => RefreshIndicator(
              onRefresh: () => ref.refresh(rankedTokenVmProvider.future),
              child: ListView.builder(
                  itemCount: gainerList.length,
                  itemBuilder: (context, index) {
                    return TokenTile(
                      token: gainerList[index],
                      timeframe: timeframe,
                    );
                  }),
            ),
            error: (err, stck) => Text(err.toString()),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}
