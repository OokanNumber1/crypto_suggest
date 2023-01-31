import 'package:crypto_suggest/src/constants/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../category/widget/category_chip.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.0.sp),
      child: CategoryChip(
        losersTimeframe: Timeframe.day,
        gainersTimeframe: Timeframe.day,
      ),
    );
  }
}
