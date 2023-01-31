import 'package:crypto_suggest/src/constants/enums.dart';
import 'package:crypto_suggest/src/features/category/viewmodel/category_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../token/views/all_token_view.dart';
import '../../token/views/gainers_view.dart';
import '../../token/views/losers.dart';

// ignore: must_be_immutable
class CategoryChip extends ConsumerStatefulWidget {
  CategoryChip({
    required this.losersTimeframe,
    required this.gainersTimeframe,
    Key? key,
  }) : super(key: key);
  Timeframe losersTimeframe;
  Timeframe gainersTimeframe;

  @override
  ConsumerState<CategoryChip> createState() => _CategoryChipState();
}

class _CategoryChipState extends ConsumerState<CategoryChip> {
  int categoryIndex = 0;
  @override
  Widget build(BuildContext context) {
    final categoryViews = [
      AllTokenView(),
      GainersView(timeframe: widget.gainersTimeframe),
      LosersView(timeframe: widget.losersTimeframe)
    ];
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.12,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            children: [
              GestureDetector(
                onTap: () => setState(() {
                  categoryIndex = 0;
                }),
                child: Row(
                  children: [
                    Chip(
                      backgroundColor: categoryIndex == 0
                          ? const Color(0xff0000ff)
                          : const Color(0xff000000),
                      label: Text(
                        categoryList[0].chipText,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(width: 16),
                    GestureDetector(
                      onTap: () => setState(() {
                        categoryIndex = 1;
                      }),
                      child: Row(
                        children: [
                          Chip(
                            backgroundColor: categoryIndex == 1
                                ? const Color(0xff0000ff)
                                : const Color(0xff000000),
                            label: Text(
                              categoryList[1].chipText,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                          Visibility(
                            visible: categoryIndex == 1,
                            child: PopupMenuButton(
                              itemBuilder: (context) => [
                                PopupMenuItem(
                                  child: const Text("1d"),
                                  onTap: () => setState(() {
                                    widget.gainersTimeframe = Timeframe.day;
                                  }),
                                ),
                                PopupMenuItem(
                                  child: const Text("7d"),
                                  onTap: () => setState(() {
                                    widget.gainersTimeframe = Timeframe.week;
                                  }),
                                ),
                                PopupMenuItem(
                                  child: const Text("30d"),
                                  onTap: () => setState(() {
                                    widget.gainersTimeframe = Timeframe.month;
                                  }),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                        width:
                            categoryIndex == 2 || categoryIndex == 0 ? 20 : 0),
                    GestureDetector(
                      onTap: () => setState(() {
                        categoryIndex = 2;
                      }),
                      child: Row(
                        children: [
                          Chip(
                            backgroundColor: categoryIndex == 2
                                ? const Color(0xff0000ff)
                                : const Color(0xff000000),
                            label: Text(
                              categoryList[2].chipText,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                          Visibility(
                            visible: categoryIndex == 2,
                            child: PopupMenuButton(
                              itemBuilder: (context) => [
                                PopupMenuItem(
                                  child: const Text("1d"),
                                  onTap: () => setState(() {
                                    widget.losersTimeframe = Timeframe.day;
                                  }),
                                ),
                                PopupMenuItem(
                                  child: const Text("7d"),
                                  onTap: () => setState(() {
                                    widget.losersTimeframe = Timeframe.week;
                                  }),
                                ),
                                PopupMenuItem(
                                  child: const Text("30d"),
                                  onTap: () => setState(() {
                                    widget.losersTimeframe = Timeframe.month;
                                  }),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        categoryViews[categoryIndex],
      ],
    );
  }
}
