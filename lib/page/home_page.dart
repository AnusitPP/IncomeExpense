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
  double balance = 0;
  final List<Map<String, dynamic>> transactions = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Wallet", showProfile: true),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 22),
          child: ListView(
            children: [
              CustomWallet(balance: balance),
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
                transactions:
                    transactions
                        .map(
                          (t) => {
                            'title': t['title'].toString(),
                            'amount': (t['amount'] as num).toDouble(),
                          },
                        )
                        .toList(),
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
            onTap: () => addTransaction(true),
          ),
          SpeedDialChild(
            shape: CircleBorder(),
            backgroundColor: Colors.red[400],
            child: Icon(Icons.remove, color: Colors.white, size: 40),
            label: "Add Expense",
            labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            onTap: () => addTransaction(false),
          ),
        ],
      ),
    );
  }

  Future addTransaction(bool isIncome) {
    final TextEditingController amountController = TextEditingController();
    final TextEditingController titleController = TextEditingController();

    return showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text(isIncome ? "Add Income" : "Add Expense"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(hintText: "Enter Title"),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: amountController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(hintText: "Enter Amount"),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Cancel"),
              ),
              TextButton(
                onPressed: () {
                  double? amount = double.tryParse(amountController.text);
                  if (amount != null) {
                    setState(() {
                      transactions.add({
                        'title': titleController.text,
                        'amount':
                            isIncome
                                ? amount
                                : -amount, // ตรวจสอบให้เป็น num/double
                      });
                      balance += isIncome ? amount : -amount;
                    });
                    Navigator.of(context).pop();
                  }
                },
                child: Text("Submit"),
              ),
            ],
          ),
    );
  }
}
