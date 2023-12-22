import 'dart:async';

import 'package:devfin_ui_kit/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'package:devfin_ui_kit/utils.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
    // Future.delayed(const Duration(seconds: 1), () {
    //   GoRouter.of(context).go(AppRoutes.home);
    // });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorsUtil.backgroundColor,
      body: Center(
        child: LoadingEffect(),
      ),
    );
  }
}
