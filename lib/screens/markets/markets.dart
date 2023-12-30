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
  Widget build(BuildContext context) => SafeArea(
        child: Column(
          children: [
            SizedBox(height: 8),
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
            SizedBox(height: 8),
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
    return Container(
      padding: const EdgeInsets.all(0.0),
      child: CustomScrollView(
        shrinkWrap: true,
        slivers: [
          // const SliverToBoxAdapter(
          //   child:
          //       Text('Select Market', style: TextStyle(color: Colors.white)),
          // ),
          SliverToBoxAdapter(
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return _buildTabContentItem(index);
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: 8);
              },
              itemCount: 100,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabContentItem(int index) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    Widget buildTrailingWidget(int itemNum, TextTheme textTheme) {
      final isEven = itemNum % 2 == 0;

      final color = isEven ? Colors.greenAccent : Colors.redAccent;
      final directionIcon =
          isEven ? Icons.arrow_drop_up_rounded : Icons.arrow_drop_down_rounded;
      final valueText = isEven ? '1,800.56' : '1,200.56';
      final percentageText = isEven ? '+20.23 (+0.03%)' : '-20.23 (-0.03%)';

      return Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(directionIcon, color: color, size: 32),
              Text(valueText,
                  style: textTheme.titleSmall?.copyWith(color: color)),
            ],
          ),
          Text(percentageText,
              style: textTheme.titleSmall?.copyWith(color: color)),
        ],
      );
    }

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.transparent.withOpacity(0.3),
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: ColorsUtil.linearGradientButton,
        ),
      ),
      child: ListTile(
        leading: FlutterLogo(),
        title: Text(
          'VNINDEX',
          style: textTheme.titleMedium,
        ),
        subtitle: Text(
          'VIETNAM INDEX...',
          style: textTheme.titleSmall?.copyWith(color: Colors.grey),
        ),
        trailing: buildTrailingWidget(index, textTheme),
      ),
    );
  }
}
