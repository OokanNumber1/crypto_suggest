import 'package:crypto_suggest/src/constants/app_dimensions.dart';
import 'package:crypto_suggest/src/features/home/viewmodels/nav_bar_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white70,
      elevation: AppDimensions.large,
      notchMargin: AppDimensions.small,
      shape: const CircularNotchedRectangle(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppDimensions.medium),
        child: SizedBox(
          height: kBottomNavigationBarHeight,
          child: Consumer(builder: (context, ref, child) {
            final indexWatch = ref.watch(navBarProvider);
            final indexNotifier = ref.read(navBarProvider.notifier);
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                NavigationItem(
                    icon: Icons.home,
                    label: 'Home',
                    color: indexWatch == 0 ? Colors.blue : Colors.black,
                    onClicked: () => indexNotifier.navigate(0)),
                //const Spacer(),
                NavigationItem(
                    icon: Icons.favorite,
                    label: 'Favourites',
                    color: indexWatch == 1 ? Colors.blue : Colors.black,
                    onClicked: () => indexNotifier.navigate(1)),
                /* const Spacer(flex: 2),
                    buildNavigationItem(
                      icon: Icons.new_releases,
                      label: 'Discover',
                      color: indexWatch == 2 ? Colors.blue : Colors.black,
                      onClicked: () => indexNotifier.navigate(2),
                    ),
                    const Spacer(),
                    buildNavigationItem(
                      icon: Icons.web_asset,
                      label: 'DApp',
                      color: indexWatch == 3 ? Colors.blue : Colors.black,
                      onClicked: () => indexNotifier.navigate(3),
                    ),*/
              ],
            );
          }),
        ),
      ),
    );
  }
}

class NavigationItem extends StatelessWidget {
  const NavigationItem(
      {required this.icon,
      required this.label,
      required this.color,
      required this.onClicked,
      Key? key})
      : super(key: key);

  final IconData? icon;
  final String? label;
  final Color? color;
  final Function()? onClicked;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClicked,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Icon(
          icon,
          color: color,
        ),
        Text(label!,
            style: TextStyle(
              color: color,
            ))
      ]),
    );
  }
}
