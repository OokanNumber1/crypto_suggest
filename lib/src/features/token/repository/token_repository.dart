import 'dart:io';

import 'package:crypto_suggest/src/constants/app_strings.dart';
import 'package:crypto_suggest/src/features/token/model/cmc_token.dart';
import 'package:crypto_suggest/src/services/http_service.dart';
import 'package:crypto_suggest/src/services/storage_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';

import '../../../constants/enums.dart';
enum SortType {loser,gainer}

class TokenRepository {
  const TokenRepository(
      {required this.networkService,
      required this.tokenUrl,
      required this.storageService});
  final IHttpService networkService;
  final IStorageService storageService;
  final String tokenUrl;

  Future<List<CmcToken>> getAllTokens() async {
    try {
      List decodedResponse = await networkService.get(tokenUrl);
      await storageService.save(
          key: AppStrings.tokensKey, value: decodedResponse);
      List<CmcToken> serialisedResponse =
          decodedResponse.map((token) => CmcToken.fromJson(token)).toList();
      return serialisedResponse;
    } on SocketException {
      throw "Kindly Check your Internet Connection";
    } catch (e) {
      rethrow;
    }
  }

  List<CmcToken> getGainerTokens(Timeframe timeframe, List<CmcToken> tokens) {
    sortWithTimeframe(tokens, timeframe);
    return tokens.reversed.toList();
  }

  List<CmcToken> getLoserTokens(Timeframe timeframe, List<CmcToken> tokens) {
    sortWithTimeframe(tokens, timeframe);

    return tokens.reversed.toList().reversed.toList();
  }

  void sortWithTimeframe(List<CmcToken> tokens, Timeframe timeframe,) {
    switch (timeframe) {
      case Timeframe.day:
        tokens.sort(
          (tokenA, tokenB) => tokenA.change24hr.compareTo(tokenB.change24hr),
        );
        break;
      case Timeframe.week:
        tokens.sort(
          (tokenA, tokenB) => tokenA.change7d.compareTo(tokenB.change7d),
        );
        break;
      case Timeframe.month:
        tokens.sort(
          (tokenA, tokenB) => tokenA.change30d.compareTo(tokenB.change30d),
        );
        break;
      // default:
      //   tokens.sort(
      //     (tokenA, tokenB) => tokenA.change24hr.compareTo(tokenB.change24hr),
      //   );
      //   break;
    }
  }
}

/*
Getting from cache
  Future<List<CmcToken>> loadAllTokenFromLocal() async {
    final lclToken = await storageService.read(key: AppStrings.tokensKey);

    List storageList = lclToken.toList();
    List<CmcToken> strList =
        storageList.map((e) => CmcToken.fromJson(e)).toList();

    return strList;
  }

  Future<List<CmcToken>> loadGainerTokenFromLocal() async {
    final lclToken = await storageService.read(key: AppStrings.tokensKey);
    List storageList = lclToken.toList();
    List<CmcToken> strList =
        storageList.map((e) => CmcToken.fromJson(e)).toList();
    strList.sort((a, b) => a.change24.compareTo(b.change24));
    return strList.reversed.toList();
  }

  Future<List<CmcToken>> loadLoserTokenFromLocal() async {
    final losers = await storageService.read(key: AppStrings.tokensKey) as List;
    List<CmcToken> lslst = losers.map((e) => CmcToken.fromJson(e)).toList();
    lslst.sort((a, b) => a.change24.compareTo(b.change24));
    List<CmcToken> loserLst = lslst;
    return loserLst;
  }
}
*/
final tokenRepositoryProvider = Provider((ref) {
  return TokenRepository(
    networkService: HttpService(client: Client()),
    tokenUrl: AppStrings.coinUrl!,
    storageService: LocalStorage(storage: GetStorage()),
  );
});
