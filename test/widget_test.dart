import 'package:crypto_suggest/crypto_suggest.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets("description", (tester) async {
    tester.pumpWidget(const CryptoSuggest());
  });
}
