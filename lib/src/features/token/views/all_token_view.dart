import 'dart:io';
import 'package:crypto_suggest/src/features/favourites_token/viewmodel/favourite_viewmodel.dart';
import 'package:crypto_suggest/src/features/token/viewmodels/token_viewmodel.dart';
import 'package:crypto_suggest/src/fixtures/cmc_new_response.dart';
//import 'package:crypto_suggest/src/features/favourites/viewmodel/favourite_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'token_details_view.dart';

class AllTokenView extends StatelessWidget {
  AllTokenView({Key? key}) : super(key: key);

  final NumberFormat formatter = NumberFormat.decimalPattern();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer(
        builder: (context, ref, child) {
          final favourites = ref.watch(favouriteVmProvider);
          final allCoinProvider = ref.watch(rankedTokenVmProvider);
          return allCoinProvider.when(
            data: (tokenList) => RefreshIndicator(
              onRefresh: () => ref.refresh(rankedTokenVmProvider.future),
              child: ListView.builder(
                itemCount: tokenList.length,
                itemBuilder: (_, index) => Card(
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TokenDetails(
                            token: tokenList[index],
                          ),
                        ),
                      );
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    leading: Text(tokenList[index].rank.toString()),
                    title: Text(tokenList[index].name),
                    subtitle: Row(
                      children: [
                        Text('\$${formatter.format((tokenList[index].price))}'),
                      ],
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(tokenList[index].symbol),
                        GestureDetector(
                          onTap: () {
                            ref
                                .read(favouriteVmProvider.notifier)
                                .favouriteAction(tokenList[index].id);
                          },
                          child: Icon(
                           favourites
                                    .contains(tokenList[index].id)
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: favourites
                                    .contains(tokenList[index].id)
                                ? Colors.blue
                                : Colors.grey,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            error: (error, stck) => Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$error',
                  style: const TextStyle(color: Colors.red),
                ),
                IconButton(
                    onPressed: () {
                      ref.refresh(rankedTokenVmProvider);
                    },
                    icon: const Icon(
                      Icons.refresh,
                      color: Colors.red,
                    ))
              ],
            ),
            loading: () => const Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}
