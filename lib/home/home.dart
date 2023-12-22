import 'package:devfin_ui_kit/utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:fl_chart/fl_chart.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 5,
        child: Scaffold(
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
                const TabBar(
                  isScrollable: true,
                  tabs: [
                    Tab(text: 'Indices'),
                    Tab(text: 'Stocks'),
                    Tab(text: 'Cryptocurrency'),
                    Tab(text: 'Commodities'),
                    Tab(text: 'Currencies'),
                  ],
                ),
                Expanded(
                  child: TabBarView(
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
        ),
      );

  Widget _buildTabContent() => ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => ListTile(
          leading: FlutterLogo(),
          title: Text('Bitcoin'),
          subtitle: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Add this line
            children: [
              Text('BTC'),
              Container(
                height: 100,
                width: 200,
                child: LineChart(
                  LineChartData(
                    gridData: FlGridData(show: false),
                    titlesData: FlTitlesData(show: false),
                    borderData: FlBorderData(show: false),
                    lineBarsData: [
                      LineChartBarData(
                        spots: [
                          FlSpot(0, 3),
                          FlSpot(1, 2),
                          FlSpot(2, 5),
                          FlSpot(3, 3.1),
                          FlSpot(4, 4),
                        ],
                        isCurved: true,
                        colors: [Colors.blue],
                        dotData: FlDotData(show: false),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('\$43,945.23'),
              Text('-0.0010 (-0.09%)'),
            ],
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 10.0),
          tileColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        ),
      );
}
