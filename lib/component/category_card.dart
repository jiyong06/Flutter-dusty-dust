import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dusty_dust/component/card_title.dart';
import 'package:flutter_dusty_dust/component/main_card.dart';

import '../const/colors.dart';
import '../model/stat_and_status_model.dart';
import '../utils/data_utils.dart';
import 'main_stat.dart';

class CategoryCard extends StatelessWidget {
  final String region;
  final List<StatAndStatusModel> models;
  final Color darkColor;
  final Color lightColor;

  const CategoryCard({
    super.key,
    required this.region,
    required this.models,
    required this.darkColor,
    required this.lightColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: MainCard(
        backgroundColor: lightColor,
        child: LayoutBuilder(builder: (context, constraint) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CardTitle(
                title: '종류별 통계',
                backgroundColor: darkColor,
              ),
              Expanded(
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  physics: PageScrollPhysics(),
                  children: models
                      .map(
                        (model) => MainStat(
                          width: constraint.maxWidth / 3,
                          category: DataUtils.getItemCodeKrString(
                            itemCode: model.itemCode,
                          ),
                          imgPath: model.status.imagePath,
                          level: model.status.label,
                          stat: '${model.stat.getLevelFromRegion(
                            region,
                          )}${DataUtils.getUnitFromItemCode(
                            itemCode: model.itemCode,
                          )}',
                        ),
                      )
                      .toList(),
                  // List.generate(
                  //   20,
                  //   (index) => MainStat(
                  //     width: constraint.maxWidth / 3,
                  //     category: '미세먼지$index',
                  //     imgPath: 'asset/img/best.png',
                  //     level: '최고',
                  //     stat: '0㎍/㎥',
                  //   ),
                  // ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
