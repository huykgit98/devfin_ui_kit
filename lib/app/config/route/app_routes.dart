import 'package:devfin_ui_kit/app/app.dart';
import 'package:devfin_ui_kit/screens/explore/explore.dart';
import 'package:devfin_ui_kit/screens/markets/markets.dart';
import 'package:devfin_ui_kit/screens/profile/profile.dart';
import 'package:devfin_ui_kit/screens/splash/splash_screen.dart';
import 'package:devfin_ui_kit/screens/watchlist/watchlist.dart';
import 'package:devfin_ui_kit/widgets/fade_transition_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static const splash = '/';
  static const markets = '/markets';
  static const profile = '/profile';
  static const explore = '/explore';
  static const watchlist = '/watchlist';

  static final GoRouter route = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: splash,
        builder: (context, state) {
          return const SplashView();
        },
      ),
      //Markets Tab
      GoRoute(
        path: markets,
        pageBuilder: (BuildContext context, GoRouterState state) =>
            FadeTransitionPage(
          key: scaffoldKey,
          child: const DevFinScaffold(
            selectedTab: ScaffoldTab.markets,
            child: MarketsPage(),
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
      //watchlist Tab
      GoRoute(
        path: watchlist,
        pageBuilder: (BuildContext context, GoRouterState state) =>
            FadeTransitionPage(
          key: scaffoldKey,
          child: const DevFinScaffold(
            selectedTab: ScaffoldTab.watchlist,
            child: WatchlistPage(),
          ),
        ),
      ),
      //Market Tab
      GoRoute(
        path: explore,
        pageBuilder: (BuildContext context, GoRouterState state) =>
            FadeTransitionPage(
          key: scaffoldKey,
          child: const DevFinScaffold(
            selectedTab: ScaffoldTab.explore,
            child: ExplorePage(),
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
