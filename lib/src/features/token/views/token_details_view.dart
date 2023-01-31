import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../model/cmc_token.dart';
import '../widgets/detailcard.dart';

class TokenDetails extends ConsumerWidget {
  const TokenDetails({Key? key, required this.token}) : super(key: key);
  final CmcToken token;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formatter = NumberFormat.compact();
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              token.name,
              style: const TextStyle(color: Colors.black),
            ),
            Text(
              '\$' + formatter.format(token.price),
              style: const TextStyle(color: Colors.black),
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Card(
                    child: Padding(
                  padding: EdgeInsets.all(12.0.h),
                  child: Column(
                    children: [
                      Text(
                        'Total Supply',
                        style: TextStyle(fontSize: 24.sp),
                      ),
                      SizedBox(height: 12.h),
                      Text(
                        formatter.format(token.totalSupply),
                        style: const TextStyle(fontSize: 24),
                      ),
                    ],
                  ),
                )),
                Card(
                  child: Padding(
                    padding: EdgeInsets.all(12.0.h),
                    child: Column(
                      children: [
                        Text(
                          'Market Cap',
                          style: TextStyle(fontSize: 24.sp),
                        ),
                        SizedBox(height: 12.h),
                        Text(
                          formatter.format(token.marketCap),
                          style: const TextStyle(fontSize: 24),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                    child: Padding(
                  padding: EdgeInsets.all(12.0.h),
                  child: Column(
                    children: [
                      Text(
                        'Circ. Supply',
                        style: TextStyle(fontSize: 24.sp),
                      ),
                      SizedBox(height: 12.h),
                      Text(
                        formatter.format(token.circulatingSupply),
                        style: const TextStyle(fontSize: 24),
                      ),
                    ],
                  ),
                )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DetailCard(
                  coin: token,
                  detailTitle: 'vol 24 %',
                  detailValue: token.volumeChange24,
                ),
                DetailCard(
                    coin: token,
                    detailTitle: '24hrs %',
                    detailValue: token.change24hr)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DetailCard(
                  coin: token,
                  detailTitle: '7days %',
                  detailValue: token.change7d,
                ),
                DetailCard(
                  coin: token,
                  detailTitle: '30days %',
                  detailValue: token.change30d,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
