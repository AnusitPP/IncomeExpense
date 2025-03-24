import 'package:flutter/material.dart';

class TransactionCard extends StatelessWidget {
  final List<Map<String, dynamic>> transactions; // ใช้ dynamic สำหรับรับค่าตัวเลข

  const TransactionCard({super.key, required this.transactions});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: transactions.map((transaction) {
          // ตรวจสอบว่ามีค่า 'amount' ที่เป็นตัวเลขหรือไม่
          final amount = transaction['amount'] is double
              ? transaction['amount'].toStringAsFixed(2) // ถ้าเป็น double
              : transaction['amount'].toString(); // ถ้าเป็น String

          return ListTile(
            title: Text(
              transaction['title']!,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            trailing: Text(
              amount,  // แสดงสัญลักษณ์เงินพร้อมจำนวน
              style: TextStyle(
                color: transaction['amount'] < 0 ? Colors.red : Colors.green, // ใช้สีตามจำนวน
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
