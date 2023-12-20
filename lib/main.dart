import 'package:flutter/material.dart';

import 'home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DevFin - Track All Markets',
      theme: ThemeData(
        useMaterial3: true,
        canvasColor: Color.fromARGB(255, 16, 16, 67),
      ),
      home: const HomePage(),
    );
  }
}
