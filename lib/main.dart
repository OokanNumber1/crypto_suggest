import 'package:crypto_suggest/crypto_suggest.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await dotenv.load();
  await GetStorage.init();


  runApp(
    const ProviderScope(child: CryptoSuggest()),
  );
}
