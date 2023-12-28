import 'package:flutter/material.dart';

import '../../utils.dart';

class CategoryTabBar extends StatefulWidget {
  const CategoryTabBar({
    Key? key,
    required this.controller,
    required this.data,
  }) : super(key: key);

  final TabController controller;
  final List<dynamic> data;

  @override
  State<CategoryTabBar> createState() => _CategoryTabBarState();
}

class _CategoryTabBarState extends State<CategoryTabBar> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => TabBar(
        controller: widget.controller,
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
        onTap: (index) {
          GlobalKey globalKey = widget.data[index]['key'];
          Scrollable.ensureVisible(
            globalKey.currentContext!,
            duration: const Duration(milliseconds: 250),
          );
        },
        tabs: List.generate(widget.data.length, (index) {
          var item = widget.data[index];
          return _buildTabButton('${item['label']}');
        }),
      ),
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
}
