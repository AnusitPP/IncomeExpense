import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:income/widget/custom_appbar.dart';

class TransactionHistoryPage extends StatefulWidget {
  const TransactionHistoryPage({super.key});

  @override
  State<TransactionHistoryPage> createState() => _TransactionHistoryPageState();
}

class _TransactionHistoryPageState extends State<TransactionHistoryPage> {
  double balance = 0;
  final List<Map<String, dynamic>> transactions = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "History Transaction", showProfile: false),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 22),
          child: ListView(
            children: [
              Text(
                "Balance: \$${balance.toStringAsFixed(2)}",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                "Transactions",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Column(
                children:
                    transactions.map((t) {
                      return ListTile(
                        title: Text(t['title']),
                        subtitle: Text(
                          t['amount'] >= 0
                              ? 'Income: \$${t['amount']}'
                              : 'Expense: \$${t['amount']}',
                        ),
                        trailing: Icon(
                          t['amount'] >= 0
                              ? Icons.arrow_upward
                              : Icons.arrow_downward,
                          color: t['amount'] >= 0 ? Colors.green : Colors.red,
                        ),
                      );
                    }).toList(),
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
                        'amount': isIncome ? amount : -amount,
                      });
                      balance += isIncome ? amount : -amount; // Update balance
                    });
                    Navigator.of(
                      context,
                    ).pop(); // Close the dialog after adding transaction
                  }
                },
                child: Text("Submit"),
              ),
            ],
          ),
    );
  }
}
