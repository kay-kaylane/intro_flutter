import 'package:flutter/material.dart';
//import 'package:intro_flutter/pages/counter_screen_page.dart';
import 'package:intro_flutter/pages/home_screen.dart';



class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: HomeScreen(),
        ),
      )
    );
  }
}