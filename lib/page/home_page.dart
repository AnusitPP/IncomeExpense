import 'package:flutter/material.dart';
import 'package:income/widget/custom_appbar.dart';
import 'package:income/widget/custom_transactions.dart';
import 'package:income/widget/custom_wallet.dart';
import 'package:income/widget/navbar.dart';

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
      appBar: CustomAppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 22),
          child: ListView(
            children: [
              CustomWallet(balance: balance),//TODO 
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
              TransactionCard(transactions: []), //TODO 
            ],
          ),
        ),
      ),
      bottomNavigationBar: NavBar(),
    );
  }
}

