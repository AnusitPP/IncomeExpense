import 'package:flutter/material.dart';

class TransactionProvider with ChangeNotifier {
  final List<Map<String, dynamic>> _transactions = [];

  List<Map<String, dynamic>> get transactions => _transactions;

  double get balance {
    return _transactions.fold(0, (sum, transaction) => sum + transaction['amount']);
  }

  void addTransaction({required String title, required double amount}) {
    _transactions.add({'title': title, 'amount': amount});
    notifyListeners();
  }
}
