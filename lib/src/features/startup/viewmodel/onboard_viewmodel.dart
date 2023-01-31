import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:crypto_suggest/src/services/storage_service.dart';
import 'package:get_storage/get_storage.dart';

class OnboardNotifier extends ChangeNotifier {
  PageController onboardController = PageController();
  final localStorage = LocalStorage(storage: GetStorage());

  /*
  The instance member 'localStorage' can't be accessed in an initializer.
Try replacing the reference to the instance member with a different expression
   */

  int onboardIndex = 0;
  bool onboardViewed = LocalStorage(storage: GetStorage()).read(key: 'onboard') ?? false;

  void setOnboardIndex(int newIndex) {
    onboardIndex = newIndex;
    notifyListeners();
  }

  void validateOnboard() async {
    onboardViewed = true;
    await localStorage.save(key: 'onboard', value: onboardViewed);
    onboardController.dispose();
    notifyListeners();
  }
}

final onboardProvider = ChangeNotifierProvider((ref) {
  return OnboardNotifier();
});
