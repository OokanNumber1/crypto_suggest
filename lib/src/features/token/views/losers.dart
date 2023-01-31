import 'package:crypto_suggest/src/constants/enums.dart';
import 'package:crypto_suggest/src/features/token/viewmodels/token_viewmodel.dart';
import 'package:crypto_suggest/src/features/token/widgets/token_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LosersView extends StatelessWidget {
  const LosersView({
    required this.timeframe,
    Key? key,
  }) : super(key: key);

  final Timeframe timeframe;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer(
        builder: (context, ref, child) {
          final losersProvider = ref.watch(
            losersTokenVmProvider(timeframe),
          );
          return losersProvider.when(
            data: (loserList) => RefreshIndicator(
              onRefresh: () =>
                  ref.refresh(rankedTokenVmProvider.future),
              child: ListView.builder(
                itemCount: loserList.length,
                itemBuilder: (context, index) => TokenTile(
                  token: loserList[index],
                  timeframe: timeframe,
                ),
              ),
            ),
            error: (error, stackTrace) => Center(
              child: Text('Error $error occurred'),
            ),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}
