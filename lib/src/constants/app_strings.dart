import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppStrings {
  static const appName = 'Crypto Suggest';
  static final coinUrl = dotenv.env['COINURL'];
  static const tokensKey = 'tokens';
  static const favKay = "favKey";
}
