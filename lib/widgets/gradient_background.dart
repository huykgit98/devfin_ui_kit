import 'package:devfin_ui_kit/utils.dart';
import 'package:flutter/material.dart';

class GradientBackground extends StatelessWidget {
  const GradientBackground({Key? key, this.gradient, required this.child})
      : super(key: key);
  final Gradient? gradient;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: gradient ??
                const LinearGradient(
                  colors: ColorsUtil.linearGradient,
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
          ),
        ),
        child,
      ],
    );
  }
}
