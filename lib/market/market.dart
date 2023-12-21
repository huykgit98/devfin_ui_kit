import 'package:devfin_ui_kit/utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MarketPage extends StatelessWidget {
  const MarketPage({super.key});

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
          child: Center(
            child: Column(
              children: [Text('Market BODY')],
            ),
          ),
        ),
      );
}