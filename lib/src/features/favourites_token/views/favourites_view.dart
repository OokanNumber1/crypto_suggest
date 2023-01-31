import 'package:crypto_suggest/src/features/favourites_token/viewmodel/favourite_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../token/viewmodels/token_viewmodel.dart';

class FavouritesTokenView extends StatelessWidget {
  const FavouritesTokenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer(builder: (context, ref, child) {
        final favouriteIds = ref.watch(favouriteVmProvider);
        final allTokens = ref.watch(rankedTokenVmProvider);
        return favouriteIds.isEmpty
            ? const Center(
                child: Text('No Favourite Items Yet,'),
              )
            : allTokens.when(
                data: (allTokens) {
                  final favouriteList = allTokens
                      .where((token) => favouriteIds.contains(token.id))
                      .toList();
                  return ListView.builder(
                    itemCount: favouriteList.length,
                    itemBuilder: (context, index) => Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 8,
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Row(
                          children: [
                            GestureDetector(
                                onTap: () => ref
                                    .read(favouriteVmProvider.notifier)
                                    .favouriteAction(favouriteList[index].id),
                                child: const Icon(
                                  Icons.favorite,
                                  color: Colors.blue,
                                )),
                            const Spacer(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(favouriteList[index].symbol),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    const Text('vol24%: '),
                                    Text(
                                      favouriteList[index]
                                          .volumeChange24
                                          .toStringAsFixed(2),
                                      style: TextStyle(
                                        color: favouriteList[index]
                                                    .volumeChange24 >
                                                20
                                            ? Colors.green
                                            : favouriteList[index]
                                                        .volumeChange24 <
                                                    0
                                                ? Colors.red
                                                : Colors.grey,
                                        fontSize: favouriteList[index]
                                                    .volumeChange24 >
                                                20
                                            ? 26
                                            : 20,
                                        fontWeight: favouriteList[index]
                                                    .volumeChange24 >
                                                15
                                            ? FontWeight.w600
                                            : FontWeight.w400,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            const Spacer(),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  children: [
                                    const Text('24hrs%: '),
                                    Text(
                                      favouriteList[index]
                                          .change24hr
                                          .toStringAsFixed(2),
                                      style: TextStyle(
                                        color:
                                            favouriteList[index].change24hr > 0
                                                ? Colors.blue
                                                : Colors.red,
                                        fontSize:
                                            favouriteList[index].change24hr > 10
                                                ? 24
                                                : 16,
                                        fontWeight:
                                            favouriteList[index].change24hr > 10
                                                ? FontWeight.w700
                                                : FontWeight.w400,
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Text('7days%: '),
                                    Text(
                                      favouriteList[index]
                                          .change7d
                                          .toStringAsFixed(2),
                                      style: TextStyle(
                                          color:
                                              favouriteList[index].change7d > 0
                                                  ? Colors.blue
                                                  : Colors.red,
                                          fontSize:
                                              favouriteList[index].change7d > 10
                                                  ? 24
                                                  : 16,
                                          fontWeight:
                                              favouriteList[index].change7d > 10
                                                  ? FontWeight.w700
                                                  : FontWeight.w400),
                                    )
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
                error: (error, stk) => const Center(child: Text('Error...')),
                loading: () => const Center(child: Text('Loading...')));
      }),
    );
  }
}
