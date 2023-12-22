import 'package:devfin_ui_kit/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_svg/svg.dart';
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
    Future.delayed(Duration(seconds: 1), () {
      GoRouter.of(context).go(AppRoutes.home);
    });
  }

  // String? _guard(BuildContext context, GoRouterState state) {
  //   final bool signedIn = auth.signedIn;
  //   final bool signingIn = state.matchedLocation == '/signin';
  //
  //   // Go to /signin if the user is not signed in
  //   if (!signedIn && !signingIn) {
  //     return AppRoutes.signin;
  //   }
  //   // Go to /home if the user is signed in and tries to go to /signin.
  //   else if (signedIn && signingIn) {
  //     return AppRoutes.home;
  //   }
  //
  //   // no redirect
  //   return null;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF001c27),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(
              Assets.images.devfinLauncherSvg,
            ),
          ],
        ),
      ),
    );
  }
}
