import 'package:flutter/material.dart';
import 'package:smartdust/screens/home_screen.dart';
import 'package:smartdust/screens/nav_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: NavScreen.id,
      routes: {
        HomeScreen.id: (context) => const HomeScreen(),
        NavScreen.id: (context) => const NavScreen(),
      },
    );
  }
}
