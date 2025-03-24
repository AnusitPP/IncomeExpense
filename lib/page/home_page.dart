import 'package:flutter/material.dart';
import 'package:income/widget/custom_appbar.dart';
import 'package:income/widget/custom_transactions.dart';
import 'package:income/widget/custom_wallet.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final double balance = 12940; //TODO
  final List transactions = []; //TODO

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Wallet", showProfile: true),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 22),
          child: ListView(
            children: [
              CustomWallet(balance: balance), //TODO
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Transactions",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Text(
                        "Month",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.blueGrey[800],
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.blueGrey[800],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              TransactionCard(
                transactions: [
                  {'title': 'Grocery', 'amount': -50},
                  {'title': 'Electricity Bill', 'amount': -30},
                  {'title': 'Salary', 'amount': 1500,}
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: SpeedDial(
        icon: Icons.add,
        iconTheme: IconThemeData(color: Colors.white, size: 30),
        backgroundColor: Color(0xFF2F4F5E),
        overlayColor: Colors.black,
        overlayOpacity: 0.2,
        spaceBetweenChildren: 10,
        children: [
          SpeedDialChild(
            shape: CircleBorder(),
            backgroundColor: Colors.green[400],
            child: Icon(Icons.add, color: Colors.white, size: 40),
            label: "Add Income",
            labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            onTap: () {
              addIncome();
            },
          ),
          SpeedDialChild(
            shape: CircleBorder(),
            backgroundColor: Colors.red[400],
            child: Icon(Icons.remove, color: Colors.white, size: 40),
            label: "Add Expense",
            labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Future addIncome() => showDialog(
    context: context,
    builder:
        (context) => AlertDialog(
          title: Text("Add Income"),
          content: TextField(
            autofocus: true,
            decoration: InputDecoration(hintText: "Enter Income Amount"),
          ),
          actions: [TextButton(onPressed: submit, child: Text("Submit"))],
        ),
  );

  void submit() {
    Navigator.of(context).pop();
  }
}
