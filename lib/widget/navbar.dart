import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

class NavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabChange;

  const NavBar({Key? key, required this.selectedIndex, required this.onTabChange}) : super(key: key);

  void _onTabChange(BuildContext context, int index) {
    onTabChange(index);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF2F4F5E),
        borderRadius: BorderRadius.circular(35),
      ),
      child: GNav(
        backgroundColor: Colors.transparent,
        color: Colors.white,
        activeColor: Colors.white70,
        gap: 8,
        iconSize: 24,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        selectedIndex: selectedIndex,
        onTabChange: (index) => _onTabChange(context, index),
        tabs: [
          GButton(icon: LineIcons.home, text: 'Home'),
          GButton(icon: LineIcons.pieChart, text: 'Chart'),
          GButton(icon: LineIcons.history, text: 'Transaction'),
          GButton(icon: Icons.settings_outlined, text: 'Setting'),
        ],
      ),
    );
  }
}

