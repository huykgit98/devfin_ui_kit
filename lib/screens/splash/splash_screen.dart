import 'package:devfin_ui_kit/app/app.dart';
import 'package:devfin_ui_kit/utils.dart';
import 'package:devfin_ui_kit/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:go_router/go_router.dart';

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
    Future.delayed(const Duration(seconds: 3), () {
      GoRouter.of(context).go(AppRoutes.markets);
    });
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
        child: CustomLoadingIndicator(),
      ),
    );
  }
}
