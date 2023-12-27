import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

import 'category_tab_bar.dart';
import 'content_group.dart';

class TabBarObservedScrollView extends StatefulWidget {
  const TabBarObservedScrollView(
      {Key? key,
      required this.dataList,
      required this.tabInfoList,
      this.appBar,
      this.tabBar,
      this.pinnedTabBar,
      this.floatingTabBar,
      this.hotList})
      : super(key: key);
  final List<dynamic> dataList;
  final List<dynamic>? hotList;
  final List<dynamic> tabInfoList;
  final Widget? appBar;
  final Widget? tabBar;
  final bool? pinnedTabBar;
  final bool? floatingTabBar;

  @override
  State<TabBarObservedScrollView> createState() =>
      _TabBarObservedScrollViewState();
}

class _TabBarObservedScrollViewState extends State<TabBarObservedScrollView>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: widget.tabInfoList.length, vsync: this);
  }

  @override
  void deactivate() {
    super.deactivate();
    VisibilityDetectorController.instance.notifyNow();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          if (widget.appBar != null) widget.appBar!,
          _buildTabBar(widget.tabBar),
          _buildBody(),
        ],
      ),
    );
  }

  Widget _buildTabBar(Widget? tabBar) {
    return SliverPersistentHeader(
      delegate: _CategoryTabBarDelegate(
        tabBar: tabBar,
        controller: _tabController,
        data: widget.tabInfoList,
      ),
      pinned: widget.pinnedTabBar ?? false,
      floating: widget.floatingTabBar ?? false,
    );
  }

  Widget _buildBody() {
    return SliverPadding(
      padding: const EdgeInsets.all(0.0),
      sliver: SliverToBoxAdapter(
        child: SingleChildScrollView(
          child: Column(
            children: List.generate(
              widget.dataList.length,
              (index) {
                var item = widget.dataList[index];

                return VisibilityDetector(
                  key: widget.tabInfoList[index]['key'],
                  onVisibilityChanged: (VisibilityInfo info) {
                    double screenHeight = MediaQuery.of(context).size.height;
                    double visibleAreaOnScreen =
                        info.visibleBounds.bottom - info.visibleBounds.top;

                    if (info.visibleFraction > 0.5 ||
                        visibleAreaOnScreen > screenHeight * 0.5) {
                      _tabController.animateTo(index);
                    }
                  },
                  child: ContentGroup(
                    label: item['category'],
                    data: item['items'],
                    hotList: widget.hotList,
                    bannerData: const [
                      'https://images.unsplash.com/photo-1586882829491-b81178aa622e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2850&q=80',
                      'https://images.unsplash.com/photo-1586871608370-4adee64d1794?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2862&q=80',
                      'https://images.unsplash.com/photo-1586901533048-0e856dff2c0d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80',
                      'https://images.unsplash.com/photo-1586902279476-3244d8d18285?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2850&q=80',
                      'https://images.unsplash.com/photo-1586943101559-4cdcf86a6f87?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1556&q=80',
                      'https://images.unsplash.com/photo-1586951144438-26d4e072b891?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80',
                      'https://images.unsplash.com/photo-1586953983027-d7508a64f4bb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80',
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _CategoryTabBarDelegate extends SliverPersistentHeaderDelegate {
  _CategoryTabBarDelegate({
    this.tabBar,
    required this.controller,
    required this.data,
  });

  final TabController controller;
  final List<dynamic> data;
  final Widget? tabBar;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return SizedBox.expand(
      child: tabBar ??
          CategoryTabBar(
            controller: controller,
            data: data,
          ),
    );
  }

  @override
  double get maxExtent => 60;

  @override
  double get minExtent => 60;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
