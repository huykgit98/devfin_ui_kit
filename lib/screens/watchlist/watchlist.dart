import 'package:drag_and_drop_lists/drag_and_drop_lists.dart';
import 'package:flutter/material.dart';

import '../../utils.dart';

class WatchlistPage extends StatefulWidget {
  const WatchlistPage({Key? key}) : super(key: key);

  @override
  _WatchlistPageState createState() => _WatchlistPageState();
}

class InnerList {
  final String name;
  List<String> children;
  InnerList({required this.name, required this.children});
}

class _WatchlistPageState extends State<WatchlistPage> {
  late List<InnerList> _lists;

  @override
  void initState() {
    super.initState();

    _lists = List.generate(3, (outerIndex) {
      return InnerList(
        name: outerIndex.toString(),
        children: List.generate(4, (innerIndex) => '$outerIndex.$innerIndex'),
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  _onItemReorder(
      int oldItemIndex, int oldListIndex, int newItemIndex, int newListIndex) {
    setState(() {
      var movedItem = _lists[oldListIndex].children.removeAt(oldItemIndex);
      _lists[newListIndex].children.insert(newItemIndex, movedItem);
    });
  }

  _onListReorder(int oldListIndex, int newListIndex) {
    setState(() {
      var movedList = _lists.removeAt(oldListIndex);
      _lists.insert(newListIndex, movedList);
    });
  }

  @override
  Widget build(BuildContext context) => SafeArea(
        child: ListView(children: [
          DragAndDropLists(
            disableScrolling: true,
            children:
                List.generate(_lists.length, (index) => _buildList(index)),
            onItemReorder: _onItemReorder,
            onListReorder: _onListReorder,
            listGhost: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0),
              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 30.0, horizontal: 100.0),
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(7.0),
                    color: Colors.white70,
                  ),
                  child: const Icon(Icons.add_box),
                ),
              ),
            ),
            listDecoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1.5),
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.transparent.withOpacity(0.3),
            ),
            itemDivider: const SizedBox(height: 8),
            listPadding: const EdgeInsets.all(4),
            lastListTargetSize: 0,
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.all(12),
                backgroundColor: Colors.transparent.withOpacity(0.3),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              child: const Icon(Icons.add, size: 32),
            ),
          ),
          const SizedBox(height: 12),
        ]),
      );

  _buildList(int outerIndex) {
    var innerList = _lists[outerIndex];
    return DragAndDropListExpansion(
      initiallyExpanded: true,
      title: Text('Watchlist ${innerList.name}'),
      subtitle: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('${innerList.children.length} symbols'),
        const Row(mainAxisSize: MainAxisSize.min, children: [
          Icon(Icons.edit_rounded),
          SizedBox(width: 8),
          Icon(Icons.add_box_rounded),
        ]),
      ]),

      // trailing: const Row(mainAxisSize: MainAxisSize.min, children: [
      //   Icon(Icons.add_box_rounded),
      //   SizedBox(width: 8),
      //   Icon(Icons.edit_rounded),
      // ]),
      children: List.generate(innerList.children.length,
          (index) => _buildItem(innerList.children[index])),
      listKey: ObjectKey(innerList),
      disableTopAndBottomBorders: true,
      onExpansionChanged: (value) {},
    );
  }

  _buildItem(String item) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    var itemNum = double.tryParse(item) ?? 0.0;

    Widget buildTrailingWidget(double itemNum, TextTheme textTheme) {
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

    return DragAndDropItem(
      child: Container(
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
          trailing: buildTrailingWidget(itemNum, textTheme),
        ),
      ),
    );
  }
}
