import 'package:devfin_ui_kit/widgets/tab_bar_observed_scroll_view/banner_slider.dart';
import 'package:flutter/material.dart';

class ContentGroup extends StatelessWidget {
  const ContentGroup(
      {Key? key,
      this.label,
      required this.data,
      this.hotList,
      this.bannerData,
      this.bannerTitle})
      : super(key: key);

  final String? label;
  final List<dynamic> data;
  final List<dynamic>? hotList;
  final List<dynamic>? bannerData;
  final String? bannerTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (label != null && label!.isNotEmpty) ...[
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 10),
            child: Text(label!,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          )
        ],
        if (bannerData != null && bannerData!.isNotEmpty) ...[
          BannerSlider(
            title: bannerTitle,
            data: bannerData!,
          ),
          const SizedBox(height: 16.0),
        ],
        if (hotList != null && hotList!.isNotEmpty) ...[
          SizedBox(
            height: 250.0,
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              scrollDirection: Axis.horizontal,
              itemCount: hotList?.length ?? 0,
              itemBuilder: (context, index) {
                return _buildHotListItem(item: hotList![index]);
              },
            ),
          )
        ],
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(16),
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: index == data.length - 1 ? 20 : 0,
              ),
              child: _buildListItem(id: '${index + 1}'),
            );
          },
          separatorBuilder: (context, index) {
            return const Divider();
          },
          itemCount: data.length,
        )
      ],
    );
  }

  Widget _buildListItem({required String id}) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Image.network('https://picsum.photos/500/300?random=$id'),
        ),
        const SizedBox(width: 10),
        Expanded(
          flex: 2,
          child: Text(
            'This is item numbehis is item numbr $id',
            style: const TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
      ],
    );
  }

  Widget _buildHotListItem({required dynamic item}) {
    return SizedBox(
      width: 250.0,
      height: 250.0,
      child: Card(
        // color: Colors.cyan[100 * (item.index % 9)],
        child: Text('Item ${item['index']}'),
      ),
    );
  }
}
