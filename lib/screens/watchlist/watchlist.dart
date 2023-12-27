import 'package:devfin_ui_kit/utils.dart';
import 'package:flutter/material.dart';

class WatchlistPage extends StatefulWidget {
  const WatchlistPage({Key? key}) : super(key: key);

  @override
  State createState() => _WatchlistPageState();
}

class _WatchlistPageState extends State with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: ColorsUtil.linearGradient,
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: CustomScrollView(
          slivers: [
            _buildSliverAppBar(),
            _buildSliverGrid(),
            _buildSliverToBoxAdapter(),
            _buildSliverFixedExtentList(),
          ],
        ),
      ),
    );
  }

  Widget _buildSliverAppBar() {
    return SliverAppBar(
      floating: true,
      pinned: false,
      backgroundColor: Colors.transparent,
      flexibleSpace: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: ColorsUtil.linearGradient,
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
          child: _buildTabBar(),
        ),
      ),
    );
  }

  Widget _buildTabBar() {
    return TabBar(
      controller: _tabController,
      isScrollable: true,
      dividerColor: Colors.transparent,
      tabAlignment: TabAlignment.start,
      indicator: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(color: Color(0xffd5d2d2), width: 1),
        ),
        gradient: const LinearGradient(
          colors: ColorsUtil.linearGradientButton,
        ),
      ),
      tabs: [
        _buildTabButton('Indices'),
        _buildTabButton('Stocks'),
        _buildTabButton('Cryptocurrency'),
        _buildTabButton('Commodities'),
        _buildTabButton('Currencies'),
      ],
    );
  }

  Widget _buildTabButton(String title) {
    return Tab(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(title, style: const TextStyle(color: Colors.white)),
      ),
    );
  }

  Widget _buildSliverGrid() {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200.0,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
        childAspectRatio: 4.0,
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Container(
            alignment: Alignment.center,
            color: Colors.teal[100 * (index % 9)],
            child: Text('Grid Item $index'),
          );
        },
        childCount: 20,
      ),
    );
  }

  Widget _buildSliverToBoxAdapter() {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 100.0,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) {
            return SizedBox(
              width: 100.0,
              child: Card(
                color: Colors.cyan[100 * (index % 9)],
                child: Text('Item $index'),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildSliverFixedExtentList() {
    return SliverFixedExtentList(
      itemExtent: 50.0,
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Container(
            alignment: Alignment.center,
            color: Colors.lightBlue[100 * (index % 9)],
            child: Text('List Item $index'),
          );
        },
      ),
    );
  }
}
