import 'package:flutter/material.dart';
import 'package:income/widget/custom_appbar.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Transaction",
        showProfile: false
        ),
      body: Center(
        child: Text("Transaction Page"),
      ),
    );
  }
}
