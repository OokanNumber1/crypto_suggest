import 'package:flutter/material.dart';

import '../model/cmc_token.dart';

class DetailCard extends StatelessWidget {
  const DetailCard({
    Key? key,
    required this.coin,
    required this.detailTitle,
    required this.detailValue,
  }) : super(key: key);

  final CmcToken coin;
  final String detailTitle;
  final num detailValue;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(detailTitle),
            Text(
              '${detailValue.toStringAsFixed(4)}%',
              style: TextStyle(
                  color: detailValue > 0 ? Colors.blue : Colors.red,
                  fontSize: detailValue > 10 ? 28 : 20,
                  fontWeight:
                      detailValue > 10 ? FontWeight.w700 : FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
