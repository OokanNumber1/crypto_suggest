import 'package:crypto_suggest/src/constants/app_strings.dart';
import 'package:crypto_suggest/src/features/home/views/home_view.dart';
import 'package:crypto_suggest/src/features/startup/view/onboard_and_splash_screen.dart';
import 'package:crypto_suggest/src/features/startup/viewmodel/onboard_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CryptoSuggest extends ConsumerWidget {
  const CryptoSuggest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScreenUtilInit(
      designSize: const Size(720, 1080),
      builder:(context,child)=> MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ref.watch(onboardProvider).onboardViewed
            ? const HomeView()
            : const OnboardView(),
        title: AppStrings.appName,
      ),
    );
  }
}
