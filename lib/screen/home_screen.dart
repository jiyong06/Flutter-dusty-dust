import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dusty_dust/component/card_title.dart';
import 'package:flutter_dusty_dust/component/category_card.dart';
import 'package:flutter_dusty_dust/component/hourly_card.dart';
import 'package:flutter_dusty_dust/component/main_app_bar.dart';
import 'package:flutter_dusty_dust/component/main_card.dart';
import 'package:flutter_dusty_dust/component/main_drawer.dart';
import 'package:flutter_dusty_dust/component/main_stat.dart';
import 'package:flutter_dusty_dust/const/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      drawer: MainDrawer(),
      body: CustomScrollView(
        slivers: [
          MainAppBar(),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CategoryCard(),
                const SizedBox(
                  height: 16.0,
                ),
                HourlyCard(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
