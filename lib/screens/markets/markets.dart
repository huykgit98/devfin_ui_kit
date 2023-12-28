import 'package:devfin_ui_kit/utils.dart';
import 'package:flutter/material.dart';

class MarketsPage extends StatefulWidget {
  const MarketsPage({Key? key}) : super(key: key);

  @override
  _MarketsPageState createState() => _MarketsPageState();
}

class _MarketsPageState extends State<MarketsPage>
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
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            // TabBar(
            //   controller: _tabController,
            //   isScrollable: true,
            //   dividerColor: Colors.transparent,
            //   tabAlignment: TabAlignment.start,
            //   indicator: ShapeDecoration(
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(20),
            //       side: const BorderSide(color: Color(0xffd5d2d2), width: 1),
            //     ),
            //     gradient: const LinearGradient(
            //       colors: ColorsUtil.linearGradientButton,
            //     ),
            //   ),
            //   tabs: [
            //     _buildTabButton('Indices'),
            //     _buildTabButton('Stocks'),
            //     _buildTabButton('Cryptocurrency'),
            //     _buildTabButton('Commodities'),
            //     _buildTabButton('Currencies'),
            //   ],
            // ),
            // Expanded(
            //   child: TabBarView(
            //     controller: _tabController,
            //     children: [
            //       _buildTabContent(),
            //       _buildTabContent(),
            //       _buildTabContent(),
            //       _buildTabContent(),
            //       _buildTabContent(),
            //     ],
            //   ),
            // ),
          ],
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
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.transparent.withOpacity(0.2),
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            colors: ColorsUtil.linearGradientButton,
          ),
        ),
        child: CustomScrollView(
          shrinkWrap: true,
          slivers: [
            const SliverToBoxAdapter(
              child:
                  Text('Select Market', style: TextStyle(color: Colors.white)),
            ),
            SliverToBoxAdapter(
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(16),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(
                      bottom: index == 10 - 1 ? 20 : 0,
                    ),
                    child: _buildTabContentItem(),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider();
                },
                itemCount: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabContentItem() {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Image.network('https://picsum.photos/500/300?random=1'),
        ),
        const SizedBox(width: 10),
        Expanded(
          flex: 2,
          child: Text(
            'This is item numbehis is item numbr 1',
            style: const TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
