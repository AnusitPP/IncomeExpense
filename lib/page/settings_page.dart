import 'package:flutter/material.dart';
import 'package:income/widget/custom_appbar.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Settings",
        showProfile: true
        ),
      body: Center(
        child: Text("Settings Page"),
      ),
    );
  }
}
