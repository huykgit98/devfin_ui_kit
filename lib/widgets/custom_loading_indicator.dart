import 'dart:async';

import 'package:devfin_ui_kit/app/config/gen/assets.gen.dart';
import 'package:devfin_ui_kit/utils.dart';
import 'package:flutter/material.dart';

class CustomLoadingIndicator extends StatefulWidget {
  final double imageWidth;
  final double imageHeight;

  const CustomLoadingIndicator({
    Key? key,
    this.imageWidth = 36.0,
    this.imageHeight = 36.0,
  }) : super(key: key);

  @override
  _CustomLoadingIndicatorState createState() => _CustomLoadingIndicatorState();
}

class _CustomLoadingIndicatorState extends State<CustomLoadingIndicator> {
  double _opacity = 1;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _opacity = _opacity == 1 ? 0 : 1;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        // const CircularProgressIndicator.adaptive(
        //   backgroundColor: Colors.white,
        //   valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
        //   strokeWidth: 4.0,
        // ),
        AnimatedOpacity(
            opacity: _opacity,
            duration: const Duration(seconds: 1),
            child: ClipOval(
              child: Container(
                  width: widget.imageWidth, // desired width
                  height: widget.imageHeight, // desired height
                  decoration: const BoxDecoration(
                    color: ColorsUtil.loadingIndicatorColor,
                  ),
                  child: Image(image: AssetImage(Assets.images.tiger.path))),
            )),
      ],
    );
  }
}
