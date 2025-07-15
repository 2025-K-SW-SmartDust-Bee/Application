import 'package:flutter/material.dart';
import 'package:smartdust/screens/analysis_screen.dart';
import 'package:smartdust/screens/today_screen.dart';
import 'package:smartdust/widgets/bottom_nav_bar.dart';

class NavScreen extends StatefulWidget {
  static String id = 'nav-screen';
  const NavScreen({super.key});

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [TodayScreen(), AnalysisScreen()];

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _selectedIndex, children: _screens),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onTap,
      ),
    );
  }
}
