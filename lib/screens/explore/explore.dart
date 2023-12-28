import 'dart:math' as math;

import 'package:devfin_ui_kit/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  final List<dynamic> _dataList = [];
  final List<dynamic> _tabInfoList = [];
  final List<dynamic> _hotList = [];

  void _getData() {
    for (int i = 0; i < 10; i++) {
      _dataList.add({
        'category': 'Category ${i + 1}',
        'items': List.generate(math.Random().nextInt(20) + 5, (index) => null),
      });
    }
  }

  void _getHotListData() {
    for (int i = 0; i < 10; i++) {
      _hotList.add({
        'category': 'Category ${i + 1}',
        'items': List.generate(math.Random().nextInt(20) + 5, (index) => null),
      });
    }
  }

  void _initTabList() {
    for (int i = 0; i < _dataList.length; i++) {
      _tabInfoList.add({
        'key': GlobalKey(),
        'label': _dataList[i]['category'],
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _getData();
    _initTabList();
    _getHotListData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: TabBarObservedScrollView(
        dataList: _dataList,
        tabInfoList: _tabInfoList,
        floatingTabBar: true,
        hotList: _hotList,
      ),
    );
  }
}
