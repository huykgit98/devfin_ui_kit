import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class BannerSlider extends StatefulWidget {
  const BannerSlider({super.key, this.title, required this.data});
  final String? title;
  final List<dynamic> data;
  @override
  State<StatefulWidget> createState() {
    return _BannerSliderState();
  }
}

class _BannerSliderState extends State<BannerSlider> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      for (var imageUrl in widget.data) {
        precacheImage(NetworkImage(imageUrl), context);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.title != null) ...[
          Text(widget.title ?? ''),
          const SizedBox(height: 16),
        ],
        CarouselSlider.builder(
          itemCount: widget.data.length,
          options: CarouselOptions(
            autoPlay: true,
            aspectRatio: 2.0,
            enlargeCenterPage: true,
          ),
          itemBuilder: (context, index, realIdx) {
            return Center(
                child: Image.network(widget.data[index],
                    fit: BoxFit.cover, width: 1000));
          },
        )
      ],
    );
  }
}
