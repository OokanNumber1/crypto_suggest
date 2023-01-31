import 'package:crypto_suggest/src/constants/app_strings.dart';
import 'package:crypto_suggest/src/features/token/model/cmc_token.dart';
import 'package:crypto_suggest/src/services/storage_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';

class FavouriteNotifier extends StateNotifier<List<String>> {
  FavouriteNotifier({
    required this.localStorage,
    required this.favKey,
  }) : super([]);
  final LocalStorage localStorage;
  final String favKey;

  List<String> getfavouriteIds() {
    List? fromLcl = localStorage.read(key: favKey);

    if (fromLcl != null) {
    state = fromLcl.map((e) => e.toString()).toList() ;
    return state;
    }

    return [];
  }

  Future<void> favouriteAction(String tokenId) async {
    Set<String> lclFaveSet = state.toSet();
    lclFaveSet.contains(tokenId)
        ? lclFaveSet.remove(tokenId)
        : lclFaveSet.add(tokenId);
    state = lclFaveSet.toList();
    await localStorage.save(key: favKey, value: state);
  }
}

final favouriteVmProvider =
    StateNotifierProvider<FavouriteNotifier, List<String>>((ref) {
  return FavouriteNotifier(
    localStorage: LocalStorage(storage: GetStorage()),
    favKey: AppStrings.favKay,
  );
});

//final favoriteProvider = FutureProvider<>((ref) async {
//   return ;
// });