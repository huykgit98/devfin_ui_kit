import 'package:devfin_ui_kit/utils.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
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
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: ColorsUtil.linearGradient,
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
          child: Column(
            children: [
              TabBar(
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
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    _buildTabContent(),
                    _buildTabContent(),
                    _buildTabContent(),
                    _buildTabContent(),
                    _buildTabContent(),
                  ],
                ),
              ),
            ],
          ),
        ),
      );

  Widget _buildTabButton(String title) {
    return Tab(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(title, style: const TextStyle(color: Colors.white)),
      ),
    );
  }

  Widget _buildTabContent() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.transparent.withOpacity(0.2),
          border: Border.all(color: Color(0xffd5d2d2), width: 1),
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            colors: ColorsUtil.linearGradientButton,
          ),
        ),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) => ListTile(
            leading: FlutterLogo(),
            title: const Text('Bitcoin', style: TextStyle(color: Colors.white)),
            subtitle: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'BTC',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
