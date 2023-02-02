import 'package:crypto_suggest/src/constants/app_strings.dart';
import 'package:crypto_suggest/src/features/home/viewmodels/nav_bar_viewmodel.dart';
import 'package:crypto_suggest/src/features/home/views/dashboard.dart';
import 'package:crypto_suggest/src/features/home/widgets/bottom_nav_bar.dart';
import 'package:crypto_suggest/src/features/favourites_token/viewmodel/favourite_viewmodel.dart';
import 'package:crypto_suggest/src/features/favourites_token/views/favourites_view.dart';
import 'package:crypto_suggest/src/features/home/widgets/floating_action_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeView extends ConsumerWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // getting the favourite Ids before they could
    // be requested for.
     ref.watch(favouriteVmProvider.notifier).getfavouriteIds();
    final navigationViews = [
      const Dashboard(),
      const FavouritesTokenView(),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          AppStrings.appName,
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white24,
        centerTitle: true,
        elevation: 0,
      ),
      body: Consumer(
        builder: (context, ref, child) =>
            navigationViews[ref.watch(navBarProvider)],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const MyFAB(),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
