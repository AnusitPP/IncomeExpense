import 'package:flutter/material.dart';

class TransactionCard extends StatelessWidget {
  final List<Map<String, String>> transactions;

  const TransactionCard({super.key, required this.transactions});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: transactions.map((transaction) {
          return ListTile(
            title: Text(
              transaction['title']!,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: Text(
              transaction['amount']!,
              style: TextStyle(
                color: Colors.red,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
