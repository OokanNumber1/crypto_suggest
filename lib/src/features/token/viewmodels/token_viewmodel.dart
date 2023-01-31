import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../constants/enums.dart';
import '../model/cmc_token.dart';
import '../repository/token_repository.dart';

class TokenNotifier extends StateNotifier<List<CmcToken>> {
  TokenNotifier({required this.tokenRepository}) : super([]);

  final TokenRepository tokenRepository;
  Future<List<CmcToken>> getAllRankedToken() async {
    state = [...(await tokenRepository.getAllTokens())];
    return state;
  }

  List<CmcToken> getGainersToken(Timeframe timeframe)  {
    final stateCopy = List<CmcToken>.from(state);
    return tokenRepository.getGainerTokens(timeframe, stateCopy);
  }

  List<CmcToken> getLosersToken(Timeframe timeframe) {
    final stateCopy = List<CmcToken>.from(state);
    return tokenRepository.getLoserTokens(timeframe,stateCopy);
  }
}

final tokenVmProvider =
    StateNotifierProvider<TokenNotifier, List<CmcToken>>((ref) {
  return TokenNotifier(tokenRepository: ref.watch(tokenRepositoryProvider));
});

final rankedTokenVmProvider = FutureProvider<List<CmcToken>>((ref) async {
  return ref.watch(tokenVmProvider.notifier).getAllRankedToken();
});

final gainersTokenVmProvider =
    FutureProvider.family<List<CmcToken>, Timeframe>((ref, timeframe)  {
  return ref.watch(tokenVmProvider.notifier).getGainersToken(timeframe);
});

final losersTokenVmProvider =
    FutureProvider.family<List<CmcToken>, Timeframe>((ref, timeframe)  {
  return ref.watch(tokenVmProvider.notifier).getLosersToken(timeframe);
});


/*
final allCoinViewmodel = FutureProvider<List<CmcToken>>((ref) async {
  if (await InternetConnectionChecker().hasConnection) {
    return TokenRepository(
      networkService: HttpService(
        client: Client(),
      ),
      storageService: LocalStorage(
        storage: GetStorage(),
      ),
    ).getAllTokens(AppStrings.coinUrl!);
  } else {
    return TokenRepository(
      networkService: HttpService(client: Client()),
      storageService: LocalStorage(
        storage: GetStorage(),
      ),
    ).loadAllTokenFromLocal();
  }
});

final gainersViewmodel = FutureProvider((ref) async {
  if (await InternetConnectionChecker().hasConnection) {
    return TokenRepository(
      networkService: HttpService(client: Client()),
      storageService: LocalStorage(storage: GetStorage()),
    ).getGainerTokens(AppStrings.coinUrl!);
  } else {
    return TokenRepository(
      networkService: HttpService(client: Client()),
      storageService: LocalStorage(
        storage: GetStorage(),
      ),
    ).loadGainerTokenFromLocal();
  }
});

final losersViewmodel = FutureProvider((ref) async {
  if (await InternetConnectionChecker().hasConnection) {
    return TokenRepository(
            networkService: HttpService(client: Client()),
            storageService: LocalStorage(storage: GetStorage()))
        .getLoserTokens(AppStrings.coinUrl!);
  } else {
    return TokenRepository(
      networkService: HttpService(client: Client()),
      storageService: LocalStorage(
        storage: GetStorage(),
      ),
    ).loadLoserTokenFromLocal();
  }
});
*/