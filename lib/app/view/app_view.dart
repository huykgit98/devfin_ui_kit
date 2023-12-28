import 'package:devfin_ui_kit/app/app.dart';
import 'package:devfin_ui_kit/screens/authentication/authentication.dart';
import 'package:devfin_ui_kit/screens/sign_up_bottom_sheet/sign_up_bottom_sheet.dart';
import 'package:devfin_ui_kit/utils.dart';
import 'package:devfin_ui_kit/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

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
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            brightness: Brightness.light,
            seedColor: Colors.transparent,
          ),
          textTheme: TextTheme(
            displayLarge: const TextStyle(
              fontSize: 72,
              fontWeight: FontWeight.bold,
            ),
            titleLarge: GoogleFonts.oswald(
              fontSize: 30,
              fontStyle: FontStyle.italic,
            ),
            bodyMedium: GoogleFonts.merriweather(),
            displaySmall: GoogleFonts.pacifico(),
          ),
        ),
        darkTheme: ThemeData.dark(),
        themeMode: darkMode ? ThemeMode.dark : ThemeMode.light,
      ),
    );
  }
}

class DevFinScaffold extends ConsumerWidget {
  const DevFinScaffold({
    required this.selectedTab,
    required this.child,
    super.key,
  });

  final ScaffoldTab selectedTab;
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) => GradientBackground(
        gradient: const LinearGradient(
          colors: ColorsUtil.linearGradient,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: child,
          extendBody: true,
          drawer: _buildDrawer(context, ref),
          bottomNavigationBar:
              _buildBottomAppBar(context, ref.watch(darkModeProvider)),
          appBar: _buildAppBar(context),
        ),
      );

  Widget _buildBottomAppBar(BuildContext context, bool darkMode) {
    return NavigationBar(
      onDestinationSelected: (int idx) {
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
      height: 56,
      indicatorColor: darkMode ? Colors.white : Colors.grey.shade400,
      backgroundColor: Colors.transparent,
      selectedIndex: selectedTab.index,
      labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
      destinations: const <Widget>[
        NavigationDestination(
          icon: Icon(Icons.bar_chart_rounded),
          label: 'Markets',
        ),
        NavigationDestination(
          icon: Icon(Icons.explore_rounded),
          label: 'Explore',
        ),
        NavigationDestination(
            icon: Icon(Icons.star_rounded), label: 'Watchlist'),
        NavigationDestination(
          icon: Icon(Icons.person_rounded),
          label: 'Profile',
        ),
      ],
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
      // backgroundColor: Colors.transparent,
      child: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: darkMode
                ? ColorsUtil.linearGradient
                : ColorsUtil.linearGradientLightMode,
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: darkMode
                    ? ColorsUtil.linearGradient
                    : ColorsUtil.linearGradientLightMode,
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
        backgroundColor: Colors.transparent,
        leading: Builder(
          builder: (context) => IconButton(
            iconSize: 32,
            icon: const Icon(Icons.menu_rounded, color: Colors.white),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        // flexibleSpace: Container(
        //   decoration: const BoxDecoration(
        //     gradient: LinearGradient(
        //       colors: ColorsUtil.linearGradient,
        //       begin: Alignment.topLeft,
        //       end: Alignment.bottomRight,
        //     ),
        //   ),
        // ),
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
