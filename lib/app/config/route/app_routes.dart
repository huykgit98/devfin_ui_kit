import 'package:devfin_ui_kit/app/app.dart';
import 'package:devfin_ui_kit/authentication/authentication.dart';
import 'package:devfin_ui_kit/home/home.dart';
import 'package:devfin_ui_kit/market/market.dart';
import 'package:devfin_ui_kit/portfolio/portfolio.dart';
import 'package:devfin_ui_kit/profile/profile.dart';
import 'package:devfin_ui_kit/sign_in/sign_in.dart';
import 'package:devfin_ui_kit/splash/splash_screen.dart';
import 'package:devfin_ui_kit/widgets/fade_transition_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static const splash = '/';
  static const home = '/home';
  static const profile = '/profile';
  static const market = '/market';
  static const portfolio = '/portfolio';

  static const signin = '/signin';

  static final GoRouter route = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: splash,
        builder: (context, state) {
          return const SplashView();
        },
      ),
      GoRoute(
        path: signin,
        pageBuilder: (BuildContext context, GoRouterState state) =>
            FadeTransitionPage(
          key: state.pageKey,
          child: SignInScreen(
            onSignIn: (Credentials credentials) {
              DevFinAuthScope.of(context)
                  .signIn(credentials.username, credentials.password);
            },
          ),
        ),
      ),

      //Home Tab
      GoRoute(
        path: home,
        pageBuilder: (BuildContext context, GoRouterState state) =>
            FadeTransitionPage(
          key: scaffoldKey,
          child: const DevFinScaffold(
            selectedTab: ScaffoldTab.home,
            child: HomePage(),
          ),
        ),
        routes: <GoRoute>[
          // GoRoute(
          //   path: ':authorId',
          //   builder: (BuildContext context, GoRouterState state) {
          //     final int authorId = int.parse(state.pathParameters['authorId']!);
          //     final Author? selectedAuthor =
          //         libraryInstance.allAuthors.firstWhereOrNull((Author a) => a.id == authorId);

          //     return AuthorDetailsScreen(author: selectedAuthor);
          //   },
          // ),
        ],
      ),
      //Portfolio Tab
      GoRoute(
        path: portfolio,
        pageBuilder: (BuildContext context, GoRouterState state) =>
            FadeTransitionPage(
          key: scaffoldKey,
          child: const DevFinScaffold(
            selectedTab: ScaffoldTab.portfolio,
            child: PortfolioPage(),
          ),
        ),
      ),
      //Market Tab
      GoRoute(
        path: market,
        pageBuilder: (BuildContext context, GoRouterState state) =>
            FadeTransitionPage(
          key: scaffoldKey,
          child: const DevFinScaffold(
            selectedTab: ScaffoldTab.market,
            child: MarketPage(),
          ),
        ),
      ),
      //Profile Tab
      GoRoute(
        path: profile,
        pageBuilder: (BuildContext context, GoRouterState state) =>
            FadeTransitionPage(
          key: scaffoldKey,
          child: const DevFinScaffold(
            selectedTab: ScaffoldTab.profile,
            child: ProfilePage(),
          ),
        ),
      ),
    ],
    // redirect: guard,
    refreshListenable: auth,
    debugLogDiagnostics: true,
  );
}
