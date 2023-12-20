import 'package:devfin_ui_kit/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _buildDrawer(),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: _buildAppBar(),
      ),
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: ColorsUtil.linearGradient,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        )),
        child: const Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[],
        )),
      ),
      bottomNavigationBar: _buildBottomAppBar(),
    );
  }

  Widget _buildBottomAppBar() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.business),
          label: 'Portfolio',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_box),
          label: 'Add',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bar_chart),
          label: 'Market',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.amber[800],
      onTap: _onItemTapped,
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Text('Drawer Header'),
          ),
          ListTile(
            title: const Text('Home'),
            selected: true,
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Portfolio'),
            selected: false,
            onTap: () {
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Market'),
            selected: false,
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Profile'),
            selected: false,
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      leading: Builder(
        builder: (context) => IconButton(
          iconSize: 32,
          icon: const Icon(Icons.menu_outlined, color: Colors.white),
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
          prefixIcon: Icon(Icons.search, color: Colors.white, size: 24),
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
              icon: const Icon(Icons.chat_bubble_outline),
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
              icon: const Icon(Icons.notifications_none),
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
    );
  }

  Widget _buildAppBar1() {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: const TextField(
        decoration: InputDecoration(
          hintText: 'Search',
          prefixIcon: Icon(Icons.search),
          border: InputBorder.none,
        ),
      ),
      actions: <Widget>[
        Stack(
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.chat_bubble_outline),
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
              icon: const Icon(Icons.notifications_none),
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
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bottom App Bar Demo'),
      ),
      body: Column(
        children: [
          Container(
            width: 375,
            height: 812,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(color: Color(0xFFF8F9FA)),
            child: Stack(
              children: [
                // _buildBannerSection([
                //   'https://example.com/image1.jpg',
                //   'https://example.com/image2.jpg',
                //   'https://example.com/image3.jpg',
                // ]),
                Positioned(
                  left: 16,
                  top: 229,
                  child: Container(
                    width: 343,
                    height: 1134,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(),
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Text(
                            'Trending Coins',
                            style: TextStyle(
                              color: Color(0xFF212529),
                              fontSize: 20,
                              fontFamily: 'Circular Std',
                              fontWeight: FontWeight.w700,
                              height: 0.05,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          top: 36,
                          child: Container(
                            width: 343,
                            height: 632,
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 0,
                                  top: 480,
                                  child: Container(
                                    width: 343,
                                    height: 72,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          left: 0,
                                          top: 0,
                                          child: Container(
                                            width: 343,
                                            height: 72,
                                            decoration: ShapeDecoration(
                                              color: Colors.white,
                                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                              shadows: [
                                                BoxShadow(
                                                  color: Color(0x13000000),
                                                  blurRadius: 4,
                                                  offset: Offset(0, 2),
                                                  spreadRadius: 0,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 68,
                                          top: 18,
                                          child: Text(
                                            'Dogecoin',
                                            style: TextStyle(
                                              color: Color(0xFF212529),
                                              fontSize: 16,
                                              fontFamily: 'Circular Std',
                                              fontWeight: FontWeight.w500,
                                              height: 0,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 276,
                                          top: 17,
                                          child: Text(
                                            '₹23.39',
                                            style: TextStyle(
                                              color: Color(0xFF343A40),
                                              fontSize: 16,
                                              fontFamily: 'Circular Std',
                                              fontWeight: FontWeight.w500,
                                              height: 0,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 68,
                                          top: 41,
                                          child: Text(
                                            'DOGE',
                                            style: TextStyle(
                                              color: Color(0xFF6C757D),
                                              fontSize: 10,
                                              fontFamily: 'Circular Std',
                                              fontWeight: FontWeight.w500,
                                              height: 0,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 288,
                                          top: 42,
                                          child: Text(
                                            '+21.00%',
                                            style: TextStyle(
                                              color: Color(0xFF21BF73),
                                              fontSize: 10,
                                              fontFamily: 'Circular Std',
                                              fontWeight: FontWeight.w500,
                                              height: 0,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 16,
                                          top: 16,
                                          child: Container(
                                            width: 40,
                                            height: 40,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: NetworkImage("https://via.placeholder.com/40x40"),
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 0,
                                  top: 560,
                                  child: Container(
                                    width: 343,
                                    height: 72,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          left: 0,
                                          top: 0,
                                          child: Container(
                                            width: 343,
                                            height: 72,
                                            decoration: ShapeDecoration(
                                              color: Colors.white,
                                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                              shadows: [
                                                BoxShadow(
                                                  color: Color(0x13000000),
                                                  blurRadius: 4,
                                                  offset: Offset(0, 2),
                                                  spreadRadius: 0,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 68,
                                          top: 18,
                                          child: Text(
                                            'Dogecoin',
                                            style: TextStyle(
                                              color: Color(0xFF212529),
                                              fontSize: 16,
                                              fontFamily: 'Circular Std',
                                              fontWeight: FontWeight.w500,
                                              height: 0,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 276,
                                          top: 17,
                                          child: Text(
                                            '₹23.39',
                                            style: TextStyle(
                                              color: Color(0xFF343A40),
                                              fontSize: 16,
                                              fontFamily: 'Circular Std',
                                              fontWeight: FontWeight.w500,
                                              height: 0,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 68,
                                          top: 41,
                                          child: Text(
                                            'DOGE',
                                            style: TextStyle(
                                              color: Color(0xFF6C757D),
                                              fontSize: 10,
                                              fontFamily: 'Circular Std',
                                              fontWeight: FontWeight.w500,
                                              height: 0,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 288,
                                          top: 42,
                                          child: Text(
                                            '+21.00%',
                                            style: TextStyle(
                                              color: Color(0xFF21BF73),
                                              fontSize: 10,
                                              fontFamily: 'Circular Std',
                                              fontWeight: FontWeight.w500,
                                              height: 0,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 16,
                                          top: 16,
                                          child: Container(
                                            width: 40,
                                            height: 40,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: NetworkImage("https://via.placeholder.com/40x40"),
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 0,
                                  top: 240,
                                  child: Container(
                                    width: 343,
                                    height: 72,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          left: 0,
                                          top: 0,
                                          child: Container(
                                            width: 343,
                                            height: 72,
                                            decoration: ShapeDecoration(
                                              color: Colors.white,
                                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                              shadows: [
                                                BoxShadow(
                                                  color: Color(0x13000000),
                                                  blurRadius: 4,
                                                  offset: Offset(0, 2),
                                                  spreadRadius: 0,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 68,
                                          top: 18,
                                          child: Text(
                                            'Cardano',
                                            style: TextStyle(
                                              color: Color(0xFF212529),
                                              fontSize: 16,
                                              fontFamily: 'Circular Std',
                                              fontWeight: FontWeight.w500,
                                              height: 0,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 268,
                                          top: 17,
                                          child: Text(
                                            '₹105.06',
                                            style: TextStyle(
                                              color: Color(0xFF343A40),
                                              fontSize: 16,
                                              fontFamily: 'Circular Std',
                                              fontWeight: FontWeight.w500,
                                              height: 0,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 68,
                                          top: 41,
                                          child: Text(
                                            'ADA',
                                            style: TextStyle(
                                              color: Color(0xFF6C757D),
                                              fontSize: 8,
                                              fontFamily: 'Circular Std',
                                              fontWeight: FontWeight.w500,
                                              height: 0,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 291,
                                          top: 42,
                                          child: Text(
                                            '+16.31%',
                                            style: TextStyle(
                                              color: Color(0xFFD90429),
                                              fontSize: 10,
                                              fontFamily: 'Circular Std',
                                              fontWeight: FontWeight.w500,
                                              height: 0,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 16,
                                          top: 16,
                                          child: Container(
                                            width: 40,
                                            height: 40,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: NetworkImage("https://via.placeholder.com/40x40"),
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 0,
                                  top: 0,
                                  child: Container(
                                    width: 343,
                                    height: 72,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          left: 0,
                                          top: 0,
                                          child: Container(
                                            width: 343,
                                            height: 72,
                                            decoration: ShapeDecoration(
                                              color: Colors.white,
                                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                              shadows: [
                                                BoxShadow(
                                                  color: Color(0x13000000),
                                                  blurRadius: 4,
                                                  offset: Offset(0, 2),
                                                  spreadRadius: 0,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 255,
                                          top: 17,
                                          child: Text(
                                            '₹2,509.75',
                                            style: TextStyle(
                                              color: Color(0xFF343A40),
                                              fontSize: 16,
                                              fontFamily: 'Circular Std',
                                              fontWeight: FontWeight.w500,
                                              height: 0,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 68,
                                          top: 18,
                                          child: Container(
                                            width: 50,
                                            height: 38,
                                            child: Stack(
                                              children: [
                                                Positioned(
                                                  left: 0,
                                                  top: 0,
                                                  child: Text(
                                                    'Bitcoin',
                                                    style: TextStyle(
                                                      color: Color(0xFF212529),
                                                      fontSize: 16,
                                                      fontFamily: 'Circular Std',
                                                      fontWeight: FontWeight.w500,
                                                      height: 0,
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  left: 0,
                                                  top: 23,
                                                  child: Text(
                                                    'BTC',
                                                    style: TextStyle(
                                                      color: Color(0xFF6C757D),
                                                      fontSize: 12,
                                                      fontFamily: 'Circular Std',
                                                      fontWeight: FontWeight.w500,
                                                      height: 0,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 294,
                                          top: 42,
                                          child: Text(
                                            '+9.77%',
                                            style: TextStyle(
                                              color: Color(0xFF21BF73),
                                              fontSize: 10,
                                              fontFamily: 'Circular Std',
                                              fontWeight: FontWeight.w500,
                                              height: 0,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 16,
                                          top: 16,
                                          child: Container(
                                            width: 40,
                                            height: 40,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: NetworkImage("https://via.placeholder.com/40x40"),
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 0,
                                  top: 80,
                                  child: Container(
                                    width: 343,
                                    height: 72,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          left: 0,
                                          top: 0,
                                          child: Container(
                                            width: 343,
                                            height: 72,
                                            decoration: ShapeDecoration(
                                              color: Colors.white,
                                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                              shadows: [
                                                BoxShadow(
                                                  color: Color(0x13000000),
                                                  blurRadius: 4,
                                                  offset: Offset(0, 2),
                                                  spreadRadius: 0,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 68,
                                          top: 18,
                                          child: Text(
                                            'Ethereum',
                                            style: TextStyle(
                                              color: Color(0xFF212529),
                                              fontSize: 16,
                                              fontFamily: 'Circular Std',
                                              fontWeight: FontWeight.w500,
                                              height: 0,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 255,
                                          top: 17,
                                          child: Text(
                                            '₹2,509.75',
                                            style: TextStyle(
                                              color: Color(0xFF343A40),
                                              fontSize: 16,
                                              fontFamily: 'Circular Std',
                                              fontWeight: FontWeight.w500,
                                              height: 0,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 68,
                                          top: 41,
                                          child: Text(
                                            'ETH',
                                            style: TextStyle(
                                              color: Color(0xFF6C757D),
                                              fontSize: 10,
                                              fontFamily: 'Circular Std',
                                              fontWeight: FontWeight.w500,
                                              height: 0,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 290,
                                          top: 42,
                                          child: Text(
                                            '-21.00%',
                                            style: TextStyle(
                                              color: Color(0xFFD90429),
                                              fontSize: 10,
                                              fontFamily: 'Circular Std',
                                              fontWeight: FontWeight.w500,
                                              height: 0,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 16,
                                          top: 16,
                                          child: Container(
                                            width: 40,
                                            height: 40,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: NetworkImage("https://via.placeholder.com/40x40"),
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 0,
                                  top: 320,
                                  child: Container(
                                    width: 343,
                                    height: 72,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          left: 0,
                                          top: 0,
                                          child: Container(
                                            width: 343,
                                            height: 72,
                                            decoration: ShapeDecoration(
                                              color: Colors.white,
                                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                              shadows: [
                                                BoxShadow(
                                                  color: Color(0x13000000),
                                                  blurRadius: 4,
                                                  offset: Offset(0, 2),
                                                  spreadRadius: 0,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 68,
                                          top: 18,
                                          child: Text(
                                            'TRON ',
                                            style: TextStyle(
                                              color: Color(0xFF212529),
                                              fontSize: 16,
                                              fontFamily: 'Circular Std',
                                              fontWeight: FontWeight.w500,
                                              height: 0,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 285,
                                          top: 17,
                                          child: Text(
                                            '₹5.29',
                                            style: TextStyle(
                                              color: Color(0xFF343A40),
                                              fontSize: 16,
                                              fontFamily: 'Circular Std',
                                              fontWeight: FontWeight.w500,
                                              height: 0,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 68,
                                          top: 41,
                                          child: Text(
                                            'TRX',
                                            style: TextStyle(
                                              color: Color(0xFF6C757D),
                                              fontSize: 10,
                                              fontFamily: 'Circular Std',
                                              fontWeight: FontWeight.w500,
                                              height: 0,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 291,
                                          top: 42,
                                          child: Text(
                                            '-16.58%',
                                            style: TextStyle(
                                              color: Color(0xFFD90429),
                                              fontSize: 10,
                                              fontFamily: 'Circular Std',
                                              fontWeight: FontWeight.w500,
                                              height: 0,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 16,
                                          top: 16,
                                          child: Container(
                                            width: 40,
                                            height: 40,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: NetworkImage("https://via.placeholder.com/40x40"),
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 0,
                                  top: 160,
                                  child: Container(
                                    width: 343,
                                    height: 72,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          left: 0,
                                          top: 0,
                                          child: Container(
                                            width: 343,
                                            height: 72,
                                            child: Stack(
                                              children: [
                                                Positioned(
                                                  left: 0,
                                                  top: 0,
                                                  child: Container(
                                                    width: 343,
                                                    height: 72,
                                                    decoration: ShapeDecoration(
                                                      color: Colors.white,
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(8)),
                                                      shadows: [
                                                        BoxShadow(
                                                          color: Color(0x13000000),
                                                          blurRadius: 4,
                                                          offset: Offset(0, 2),
                                                          spreadRadius: 0,
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  left: 68,
                                                  top: 18,
                                                  child: Text(
                                                    'Band Protocol',
                                                    style: TextStyle(
                                                      color: Color(0xFF212529),
                                                      fontSize: 16,
                                                      fontFamily: 'Circular Std',
                                                      fontWeight: FontWeight.w500,
                                                      height: 0,
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  left: 268,
                                                  top: 17,
                                                  child: Text(
                                                    '₹553.06',
                                                    style: TextStyle(
                                                      color: Color(0xFF343A40),
                                                      fontSize: 16,
                                                      fontFamily: 'Circular Std',
                                                      fontWeight: FontWeight.w500,
                                                      height: 0,
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  left: 68,
                                                  top: 41,
                                                  child: Text(
                                                    'BAND',
                                                    style: TextStyle(
                                                      color: Color(0xFF6C757D),
                                                      fontSize: 10,
                                                      fontFamily: 'Circular Std',
                                                      fontWeight: FontWeight.w500,
                                                      height: 0,
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  left: 290,
                                                  top: 42,
                                                  child: Text(
                                                    '-22.97%',
                                                    style: TextStyle(
                                                      color: Color(0xFFD90429),
                                                      fontSize: 10,
                                                      fontFamily: 'Circular Std',
                                                      fontWeight: FontWeight.w500,
                                                      height: 0,
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  left: 16,
                                                  top: 16,
                                                  child: Container(
                                                    width: 40,
                                                    height: 40,
                                                    decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                        image: NetworkImage("https://via.placeholder.com/40x40"),
                                                        fit: BoxFit.fill,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 0,
                                  top: 400,
                                  child: Container(
                                    width: 343,
                                    height: 72,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          left: 0,
                                          top: 0,
                                          child: Container(
                                            width: 343,
                                            height: 72,
                                            decoration: ShapeDecoration(
                                              color: Colors.white,
                                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                              shadows: [
                                                BoxShadow(
                                                  color: Color(0x13000000),
                                                  blurRadius: 4,
                                                  offset: Offset(0, 2),
                                                  spreadRadius: 0,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 68,
                                          top: 18,
                                          child: Text(
                                            'Tether',
                                            style: TextStyle(
                                              color: Color(0xFF212529),
                                              fontSize: 16,
                                              fontFamily: 'Circular Std',
                                              fontWeight: FontWeight.w500,
                                              height: 0,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 274,
                                          top: 17,
                                          child: Text(
                                            '₹73.00',
                                            style: TextStyle(
                                              color: Color(0xFF343A40),
                                              fontSize: 16,
                                              fontFamily: 'Circular Std',
                                              fontWeight: FontWeight.w500,
                                              height: 0,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 68,
                                          top: 41,
                                          child: Text(
                                            'USDT',
                                            style: TextStyle(
                                              color: Color(0xFF6C757D),
                                              fontSize: 10,
                                              fontFamily: 'Circular Std',
                                              fontWeight: FontWeight.w500,
                                              height: 0,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 293,
                                          top: 42,
                                          child: Text(
                                            '+0.07%',
                                            style: TextStyle(
                                              color: Color(0xFF21BF73),
                                              fontSize: 10,
                                              fontFamily: 'Circular Std',
                                              fontWeight: FontWeight.w500,
                                              height: 0,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 16,
                                          top: 16,
                                          child: Container(
                                            width: 40,
                                            height: 40,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: NetworkImage("https://via.placeholder.com/40x40"),
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          top: 708,
                          child: Text(
                            'Top Stories',
                            style: TextStyle(
                              color: Color(0xFF212529),
                              fontSize: 20,
                              fontFamily: 'Circular Std',
                              fontWeight: FontWeight.w700,
                              height: 0.05,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          top: 750,
                          child: Container(
                            width: 253,
                            height: 263,
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 0,
                                  top: 0,
                                  child: SizedBox(
                                    width: 253,
                                    child: Text(
                                      'Why Bitcoiners Are Rooting for This Latest China Mining Ban to Finally, Actually Be Real',
                                      style: TextStyle(
                                        color: Color(0xFF343A40),
                                        fontSize: 16,
                                        fontFamily: 'Circular Std',
                                        fontWeight: FontWeight.w500,
                                        height: 0.08,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 0,
                                  top: 64,
                                  child: Text(
                                    'Decrypt',
                                    style: TextStyle(
                                      color: Color(0xFF6C757D),
                                      fontSize: 10,
                                      fontFamily: 'Circular Std',
                                      fontWeight: FontWeight.w500,
                                      height: 0,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 47,
                                  top: 64,
                                  child: Text(
                                    '12 hrs ago',
                                    style: TextStyle(
                                      color: Color(0xFF6C757D),
                                      fontSize: 10,
                                      fontFamily: 'Circular Std',
                                      fontWeight: FontWeight.w500,
                                      height: 0,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 53,
                                  top: 157,
                                  child: Text(
                                    '08 hrs ago',
                                    style: TextStyle(
                                      color: Color(0xFF6C757D),
                                      fontSize: 10,
                                      fontFamily: 'Circular Std',
                                      fontWeight: FontWeight.w500,
                                      height: 0,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 53,
                                  top: 250,
                                  child: Text(
                                    '16 hrs ago',
                                    style: TextStyle(
                                      color: Color(0xFF6C757D),
                                      fontSize: 10,
                                      fontFamily: 'Circular Std',
                                      fontWeight: FontWeight.w500,
                                      height: 0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          top: 907,
                          child: Text(
                            'Coindesk',
                            style: TextStyle(
                              color: Color(0xFF6C757D),
                              fontSize: 10,
                              fontFamily: 'Circular Std',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          top: 843,
                          child: SizedBox(
                            width: 253,
                            child: Text(
                              '‘Grayscale Discount’ Narrows to 10% and Could Shrink More as Lockups Expire',
                              style: TextStyle(
                                color: Color(0xFF343A40),
                                fontSize: 16,
                                fontFamily: 'Circular Std',
                                fontWeight: FontWeight.w500,
                                height: 0.08,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          top: 1000,
                          child: Text(
                            'Coindesk',
                            style: TextStyle(
                              color: Color(0xFF6C757D),
                              fontSize: 10,
                              fontFamily: 'Circular Std',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          top: 936,
                          child: SizedBox(
                            width: 246,
                            child: Text(
                              'Elon Musk Says Lightning Network ‘Needed’ to Scale Bitcoin for Now',
                              style: TextStyle(
                                color: Color(0xFF343A40),
                                fontSize: 16,
                                fontFamily: 'Circular Std',
                                fontWeight: FontWeight.w500,
                                height: 0.08,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 253,
                          top: 750,
                          child: Container(
                            width: 90,
                            height: 64,
                            decoration: ShapeDecoration(
                              image: DecorationImage(
                                image: NetworkImage("https://via.placeholder.com/90x64"),
                                fit: BoxFit.fill,
                              ),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 253,
                          top: 843,
                          child: Container(
                            width: 90,
                            height: 64,
                            decoration: ShapeDecoration(
                              image: DecorationImage(
                                image: NetworkImage("https://via.placeholder.com/90x64"),
                                fit: BoxFit.fill,
                              ),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 253,
                          top: 936,
                          child: Container(
                            width: 90,
                            height: 64,
                            decoration: ShapeDecoration(
                              image: DecorationImage(
                                image: NetworkImage("https://via.placeholder.com/90x64"),
                                fit: BoxFit.fill,
                              ),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 41,
                          top: 825,
                          child: Container(
                            width: 2,
                            height: 2,
                            decoration: ShapeDecoration(
                              color: Color(0xFF6C757D),
                              shape: OvalBorder(),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 47,
                          top: 913,
                          child: Container(
                            width: 2,
                            height: 2,
                            decoration: ShapeDecoration(
                              color: Color(0xFF6C757D),
                              shape: OvalBorder(),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 47,
                          top: 1006,
                          child: Container(
                            width: 2,
                            height: 2,
                            decoration: ShapeDecoration(
                              color: Color(0xFF6C757D),
                              shape: OvalBorder(),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          top: 1023,
                          child: Container(
                            width: 343,
                            height: 111,
                            decoration: BoxDecoration(color: Color(0xFFF8F9FA)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 724,
                  child: Container(
                    width: 375,
                    height: 88,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Container(
                            width: 375,
                            height: 88,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x26000000),
                                  blurRadius: 16,
                                  offset: Offset(8, 0),
                                  spreadRadius: 0,
                                )
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          left: 41,
                          top: 19.78,
                          child: Container(
                            width: 28,
                            height: 34.61,
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 0,
                                  top: 21.75,
                                  child: SizedBox(
                                    width: 28,
                                    height: 12.85,
                                    child: Text(
                                      'Home',
                                      style: TextStyle(
                                        color: Color(0xFF0063F5),
                                        fontSize: 10,
                                        fontFamily: 'Circular Std',
                                        fontWeight: FontWeight.w500,
                                        height: 0,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          left: 101,
                          top: 19.78,
                          child: Container(
                            width: 39,
                            height: 34.61,
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 0,
                                  top: 21.75,
                                  child: SizedBox(
                                    width: 39,
                                    height: 12.85,
                                    child: Text(
                                      'Portfolio',
                                      style: TextStyle(
                                        color: Color(0xFF6C757D),
                                        fontSize: 10,
                                        fontFamily: 'Circular Std',
                                        fontWeight: FontWeight.w500,
                                        height: 0,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          left: 172,
                          top: 19.78,
                          child: Container(
                            width: 39,
                            height: 34.61,
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 0,
                                  top: 21.75,
                                  child: SizedBox(
                                    width: 39,
                                    height: 12.85,
                                    child: Text(
                                      'Rewards',
                                      style: TextStyle(
                                        color: Color(0xFF6C757D),
                                        fontSize: 10,
                                        fontFamily: 'Circular Std',
                                        fontWeight: FontWeight.w500,
                                        height: 0,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          left: 243,
                          top: 19.78,
                          child: Container(
                            width: 33,
                            height: 34.61,
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 0,
                                  top: 21.75,
                                  child: SizedBox(
                                    width: 33,
                                    height: 12.85,
                                    child: Text(
                                      'Market',
                                      style: TextStyle(
                                        color: Color(0xFF6C757D),
                                        fontSize: 10,
                                        fontFamily: 'Circular Std',
                                        fontWeight: FontWeight.w500,
                                        height: 0,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          left: 308,
                          top: 19.78,
                          child: Container(
                            width: 30,
                            height: 34.61,
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 0,
                                  top: 21.75,
                                  child: SizedBox(
                                    width: 30,
                                    height: 12.85,
                                    child: Text(
                                      'Profile',
                                      style: TextStyle(
                                        color: Color(0xFF6C757D),
                                        fontSize: 10,
                                        fontFamily: 'Circular Std',
                                        fontWeight: FontWeight.w500,
                                        height: 0,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 121,
                  top: 799,
                  child: Container(
                    width: 133.95,
                    height: 5,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Container(
                            width: 133.95,
                            height: 5,
                            decoration: ShapeDecoration(
                              color: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBannerSection(List<String> imageUrls) {
    return Positioned(
      left: 16,
      top: 20,
      child: SizedBox(
        width: 343,
        height: 141,
        child: Swiper(
          itemCount: imageUrls.length,
          layout: SwiperLayout.STACK,
          itemWidth: 300,
          itemHeight: 200,
          itemBuilder: (BuildContext context, int index) {
            return Image.network(
              "https://via.placeholder.com/288x188",
              fit: BoxFit.fill,
            );
          },
        ),
      ),
    );
  }

  Widget _buildTrendingCoinsSection(List<String> imageUrls) {
    return Container();
  }
}
