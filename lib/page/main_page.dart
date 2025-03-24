import 'package:flutter/material.dart';
import 'package:income/page/chart_page.dart';
import 'package:income/page/home_page.dart';
import 'package:income/page/settings_page.dart';
import 'package:income/page/transaction_page.dart';
import 'package:income/widget/navbar.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    ChartPage(),
    TransactionPage(),
    SettingsPage(),
  ];

  void _onTabChange(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: NavBar(
        selectedIndex: _selectedIndex,
        onTabChange: _onTabChange,
      ),
      
    );
  }
}
