import 'package:devfin_ui_kit/app/app.dart';
import 'package:devfin_ui_kit/authentication/authentication.dart';
import 'package:devfin_ui_kit/utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

//TODO: Implement DI
const ValueKey<String> scaffoldKey = ValueKey<String>('App scaffold');
final DevFinAuth auth = DevFinAuth();
String? guard(BuildContext context, GoRouterState state) {
  final bool signedIn = auth.signedIn;
  final bool signingIn = state.matchedLocation == '/signin';

  // Go to /signin if the user is not signed in
  if (!signedIn && !signingIn) {
    return AppRoutes.signin;
  }
  // Go to /home if the user is signed in and tries to go to /signin.
  else if (signedIn && signingIn) {
    return AppRoutes.home;
  }

  // no redirect
  return null;
}

class DevFinApp extends StatelessWidget {
  const DevFinApp({super.key});

  @override
  Widget build(BuildContext context) => DevFinAuthScope(
        notifier: auth,
        child: MaterialApp.router(
          title: 'Devfin - Track All Markets',
          routerConfig: AppRoutes.route,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
            useMaterial3: true,
            canvasColor: Colors.black,
          ),
        ),
      );
}

/// The scaffold for the DevFin.
class DevFinScaffold extends StatelessWidget {
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
  Widget build(BuildContext context) => Scaffold(
        body: child,
        extendBody: true,
        drawer: _buildDrawer(context),
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
          icon: Icon(Icons.home_rounded),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.business_rounded),
          label: 'Portfolio',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bar_chart_rounded),
          label: 'Market',
        ),
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
          case ScaffoldTab.home:
            context.go(AppRoutes.home);
            break;
          case ScaffoldTab.portfolio:
            context.go(AppRoutes.portfolio);
            break;
          case ScaffoldTab.market:
            context.go(AppRoutes.market);
            break;
          case ScaffoldTab.profile:
            context.go(AppRoutes.profile);
            break;
        }
      },
      backgroundColor: Colors.transparent,
      elevation: 5,
    );
  }

  Widget _buildDrawer(BuildContext context) {
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
          ListTile(
            leading: const Icon(
              Icons.home_rounded,
            ),
            title: const Text('Home'),
            onTap: () {
              context.go(AppRoutes.home);

              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.business_rounded,
            ),
            title: const Text('Portfolio'),
            onTap: () {
              context.go(AppRoutes.portfolio);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.bar_chart_rounded,
            ),
            title: const Text('Market'),
            onTap: () {
              context.go(AppRoutes.market);

              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.person_rounded,
            ),
            title: const Text('Profile'),
            onTap: () {
              context.go(AppRoutes.profile);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.chat_bubble_rounded,
            ),
            title: const Text('Messages'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.notifications_active_rounded,
            ),
            title: const Text('Notifications'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout_rounded),
            title: const Text('Sign Out'),
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
        ],
      ),
    );
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
