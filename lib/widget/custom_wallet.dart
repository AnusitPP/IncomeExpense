import 'package:flutter/material.dart';

class CustomWallet extends StatelessWidget {
  final double balance;

  const CustomWallet({super.key, required this.balance});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      decoration: BoxDecoration(
        color: Color(0xFF2F4F5E),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 4),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 22, top: 12),
            child: Text(
              "Balance",
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 42, top: 12),
            child: Text(
              "\$ $balance",
              style: TextStyle(color: Colors.white, fontSize: 40),
            ),
          ),
        ],
      ),
    );
  }
}