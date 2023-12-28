import 'package:devfin_ui_kit/app/app.dart';
import 'package:devfin_ui_kit/screens/authentication/authentication.dart';
import 'package:devfin_ui_kit/screens/sign_up_bottom_sheet/sign_up_bottom_sheet.dart';
import 'package:devfin_ui_kit/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

//TODO: Implement DI
const ValueKey<String> scaffoldKey = ValueKey<String>('App scaffold');
final DevFinAuth auth = DevFinAuth();

class DevFinApp extends ConsumerWidget {
  const DevFinApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var darkMode = ref.watch(darkModeProvider);

    return DevFinAuthScope(
      notifier: auth,
      child: MaterialApp.router(
        title: 'Devfin - Track All Markets',
        routerConfig: AppRoutes.route,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: true,
        ),
        darkTheme: ThemeData.dark(),
        themeMode: darkMode ? ThemeMode.dark : ThemeMode.light,
      ),
    );
  }
}

/// The scaffold for the DevFin.
class DevFinScaffold extends ConsumerWidget {
  /// Creates a [DevFinScaffold].
  const DevFinScaffold({
    required this.selectedTab,
    required this.child,
    super.key,
  });

  /// Which tab of the scaffold to display.
  final ScaffoldTab selectedTab;

  /// The scaffold body.
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) => Scaffold(
        body: child,
        extendBody: true,
        drawer: _buildDrawer(context, ref),
        bottomNavigationBar: _buildBottomAppBar(context),
        appBar: _buildAppBar(context),
      );

  Widget _buildBody() {
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        colors: ColorsUtil.linearGradient,
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      )),
      child: child,
    );
  }

  Widget _buildBottomAppBar(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.bar_chart_rounded),
          label: 'Markets',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.explore_rounded),
          label: 'Explore',
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.star_rounded), label: 'Watchlist'),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_rounded),
          label: 'Profile',
        ),
      ],
      currentIndex: selectedTab.index,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.blueGrey,
      onTap: (int idx) {
        switch (ScaffoldTab.values[idx]) {
          case ScaffoldTab.markets:
            context.go(AppRoutes.markets);
            break;
          case ScaffoldTab.explore:
            context.go(AppRoutes.explore);
            break;
          case ScaffoldTab.watchlist:
            context.go(AppRoutes.watchlist);
            break;
          case ScaffoldTab.profile:
            SignUpSheet.show(context);
            // context.go(AppRoutes.profile);
            break;
        }
      },
      backgroundColor: Colors.transparent,
      elevation: 5,
    );
  }

  Widget _buildDrawer(BuildContext context, WidgetRef ref) {
    var darkMode = ref.watch(darkModeProvider);

    final MaterialStateProperty<Color?> trackColor =
        MaterialStateProperty.resolveWith<Color?>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return Colors.blueGrey.shade400;
        }
        return null;
      },
    );
    final MaterialStateProperty<Color?> overlayColor =
        MaterialStateProperty.resolveWith<Color?>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return Colors.amber.withOpacity(0.54);
        }
        if (states.contains(MaterialState.disabled)) {
          return Colors.grey.shade400;
        }
        return null;
      },
    );

    final MaterialStateProperty<Icon?> thumbIcon =
        MaterialStateProperty.resolveWith<Icon?>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return const Icon(Icons.mode_night_outlined);
        }
        return const Icon(Icons.light_mode_outlined);
      },
    );

    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          const UserAccountsDrawerHeader(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: ColorsUtil.linearGradient,
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            )),
            accountName: Text(
              "Huy Nguyen",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            accountEmail: Text(
              "huykgit98@gmail.com",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            currentAccountPicture: FlutterLogo(),
          ),
          _buildDrawerItem(
            'Markets',
            Icons.bar_chart_rounded,
            onTap: () {
              context.go(AppRoutes.markets);
              Navigator.pop(context);
            },
          ),
          _buildDrawerItem(
            'Explore',
            Icons.explore_rounded,
            onTap: () {
              context.go(AppRoutes.explore);
              Navigator.pop(context);
            },
          ),
          _buildDrawerItem(
            'Watchlist',
            Icons.star_rounded,
            onTap: () {
              context.go(AppRoutes.watchlist);
              Navigator.pop(context);
            },
          ),
          _buildDrawerItem(
            'Profile',
            Icons.person_rounded,
            onTap: () {
              context.go(AppRoutes.profile);
              Navigator.pop(context);
            },
          ),
          _buildDrawerItem(
            'Messages',
            Icons.chat_bubble_rounded,
            onTap: () {
              Navigator.pop(context);
            },
          ),
          _buildDrawerItem(
            'Notifications',
            Icons.notifications_active_rounded,
            onTap: () {
              Navigator.pop(context);
            },
          ),
          _buildDrawerItem(
            'Sign Out',
            Icons.logout_rounded,
            onTap: () {
              DevFinAuthScope.of(context).signOut();
            },
          ),
          const AboutListTile(
            icon: Icon(
              Icons.info,
            ),
            applicationIcon: Icon(
              Icons.local_play_rounded,
            ),
            applicationName: 'DevFin - Track All Markets',
            applicationVersion: '1.0.25',
            applicationLegalese: '© 2023 NeganDev',
            aboutBoxChildren: [
              ///Content goes here...
            ],
            child: Text('About app'),
          ),
          Switch(
            thumbIcon: thumbIcon,
            value: darkMode,
            overlayColor: overlayColor,
            trackColor: trackColor,
            thumbColor: const MaterialStatePropertyAll<Color>(Colors.black),
            onChanged: (bool value) {
              ref.read(darkModeProvider.notifier).toggle();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(String title, IconData icon, {VoidCallback? onTap}) {
    return ListTile(leading: Icon(icon), title: Text(title), onTap: onTap);
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight),
      child: AppBar(
        elevation: 5.0,
        leading: Builder(
          builder: (context) => IconButton(
            iconSize: 32,
            icon: const Icon(Icons.menu_rounded, color: Colors.white),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: ColorsUtil.linearGradient,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: const TextField(
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: 'Search',
            hintStyle: TextStyle(color: Color(0xFFA6A6AA)),
            prefixIcon:
                Icon(Icons.search_rounded, color: Colors.white, size: 24),
            filled: true,
            fillColor: Color(0xFF323340),
            border: InputBorder.none,
            isDense: true,
            contentPadding: EdgeInsets.all(8),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(40.0)),
              borderSide: BorderSide(color: Color(0xFF323340)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(40.0)),
              borderSide: BorderSide(color: Color(0xFF323340)),
            ),
          ),
        ),
        actions: <Widget>[
          Stack(
            children: <Widget>[
              IconButton(
                color: Colors.white,
                icon: const Icon(Icons.chat_bubble_outline_rounded),
                onPressed: () {},
              ),
              Positioned(
                right: 11,
                top: 11,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 14,
                    minHeight: 14,
                  ),
                  child: const Text(
                    '1',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 8,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
          Stack(
            children: <Widget>[
              IconButton(
                color: Colors.white,
                icon: const Icon(Icons.notifications_none_rounded),
                onPressed: () {},
              ),
              Positioned(
                right: 11,
                top: 11,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 14,
                    minHeight: 14,
                  ),
                  child: const Text(
                    '1',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 8,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
