import 'package:flutter_riverpod/flutter_riverpod.dart';

enum CategoryEnum { allCoins, gainers, losers }
List<CategoryEnum> categoryList = [
  CategoryEnum.allCoins,
  CategoryEnum.gainers,
  CategoryEnum.losers
];

extension CategoryExtension on CategoryEnum {
  String get chipText {
    switch (this) {
      case CategoryEnum.allCoins:
        return 'Tokens';
      case CategoryEnum.gainers:
        return 'Top Gainers';
      case CategoryEnum.losers:
        return 'Top Losers';
      default:
        return '';
    }
  }
}

// final categoryViewmodel = StateNotifierProvider((ref) {
//   return CategoryNotifier();
// });

// class CategoryNotifier extends StateNotifier<int> {
//   CategoryNotifier() : super(0);

//   void changeIndex(int newIndex) {
//     state = newIndex;
//   }
// }

