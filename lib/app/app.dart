import 'package:flutter/material.dart';

import '../views/home/home_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xFFdbebff),
          body: HomeScreen(),
        ),
      ),
    );
  }
}
