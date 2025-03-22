import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:income/page/chart_page.dart';
import 'package:income/page/home_page.dart';
import 'package:line_icons/line_icons.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key,});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {

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
        activeColor: Colors.white70, // Slightly different active color
        gap: 8,
        iconSize: 24,
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 30,
        ), // navigation bar padding
        tabs: [
          GButton(icon: LineIcons.home,
          text: 'Home', 
          onPressed: () {
            setState(() {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              });
          }),
          GButton(
            icon: LineIcons.pieChart,
            text: 'Chart',
            onPressed: () {
              setState(() {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => ChartPage()),
                );
              });
            },
          ),
          GButton(
            icon: LineIcons.history,
            text: 'Transaction',
            onPressed: () {},
          ),
          GButton(
            icon: Icons.settings_outlined,
            text: 'Setting',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
