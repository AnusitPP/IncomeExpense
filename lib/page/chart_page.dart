import 'package:flutter/material.dart';
import 'package:income/widget/navbar.dart';

class ChartPage extends StatelessWidget {
  const ChartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chart Page'),
      ),
      body: const Center(
        child: Text('Chart Page Content'),
      ),
      bottomNavigationBar: NavBar(),
    );
  }
}
