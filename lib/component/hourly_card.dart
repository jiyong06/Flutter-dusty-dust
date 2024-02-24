import 'package:flutter/material.dart';
import 'package:flutter_dusty_dust/utils/data_utils.dart';

import '../model/stat_model.dart';
import 'card_title.dart';
import 'main_card.dart';

class HourlyCard extends StatelessWidget {
  final Color darkColor;
  final Color lightColor;
  final String category;
  final List<StatModel> stats;
  final String region;

  const HourlyCard({
    super.key,
    required this.darkColor,
    required this.lightColor,
    required this.category,
    required this.stats,
    required this.region,
  });

  @override
  Widget build(BuildContext context) {
    return MainCard(
      backgroundColor: lightColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CardTitle(
            backgroundColor: darkColor,
            title: '시간별 ${category}',
          ),
          Column(
            children: stats
                .map(
                  (stat) => renderRow(
                    stat: stat,
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget renderRow({required StatModel stat}) {
    final status = DataUtils.getStatusFromItemCodeAndValue(
      value: stat.getLevelFromRegion(region),
      itemCode: stat.itemCode,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              '${stat.dataTime.hour}시',
            ),
          ),
          Expanded(
            child: Image.asset(
              status.imagePath,
              height: 20.0,
            ),
          ),
          Expanded(
            child: Text(
              status.label,
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}
