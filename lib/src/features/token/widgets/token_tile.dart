import 'package:crypto_suggest/src/constants/enums.dart';
import 'package:crypto_suggest/src/features/token/model/cmc_token.dart';
import 'package:flutter/material.dart';

import '../views/token_details_view.dart';

class TokenTile extends StatelessWidget {
  const TokenTile({
    required this.token,
    required this.timeframe,
    super.key,
  });
  final Timeframe timeframe;
  final CmcToken token;
  @override
  Widget build(BuildContext context) {
    switch (timeframe) {
      case Timeframe.day:
        return ListTile(
          trailing: Text(
            "${token.change24hr.toStringAsFixed(3)} %",
            style: TextStyle(
                color: token.change24hr > 0 ? Colors.green : Colors.red),
          ),
          title: Text(token.name),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TokenDetails(token: token),
            ),
          ),
        );
      case Timeframe.month:
        return ListTile(
          trailing: Text(
            "${token.change30d.toStringAsFixed(3)} %",
            style: TextStyle(
                color: token.change30d > 0 ? Colors.green : Colors.red),
          ),
          title: Text(token.name),
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TokenDetails(token: token),
              )),
        );
      case Timeframe.week:
        return ListTile(
          trailing: Text(
            "${token.change7d.toStringAsFixed(3)} %",
            style: TextStyle(
                color: token.change7d > 0 ? Colors.green : Colors.red),
          ),
          title: Text(token.name),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TokenDetails(token: token),
            ),
          ),
        );
      // default:
      //   return ListTile(
      //     trailing: Text(
      //       "${token.change24hr.toStringAsFixed(3)} %",
      //       style: TextStyle(
      //           color: token.change24hr > 0 ? Colors.green : Colors.red),
      //     ),
      //     title: Text(token.name),
      //     onTap: () => Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //         builder: (context) => TokenDetails(token: token),
      //       ),
      //     ),
      //   );
    }
  }
}
