import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:income/widget/custom_appbar.dart';
import 'package:income/widget/custom_transactions.dart';

class ChartPage extends StatelessWidget {
  const ChartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Chart", showProfile: false),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(8.0),
            children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 22),
              child: AspectRatio(
              aspectRatio: 1.2,
              child: PieChart(
                PieChartData(
                sections: [
                  PieChartSectionData(
                  value: 10,
                  color: Colors.red,
                  radius: 40,
                  showTitle: true,
                  title: 'A',
                  ),
                  PieChartSectionData(
                  value: 20,
                  color: Colors.amber,
                  radius: 45,
                  title: 'B',
                  ),
                  PieChartSectionData(
                  value: 30,
                  color: Colors.purple,
                  radius: 50,
                  title: 'C',
                  ),
                  PieChartSectionData(
                  value: 40,
                  color: Colors.green,
                  radius: 55,
                  title: 'D',
                  ),
                  PieChartSectionData(
                  value: 50,
                  color: Colors.lightBlue,
                  radius: 60,
                  title: 'E',
                  ),
                ],
                centerSpaceRadius: 80, //ขอบเขตวงกลม
                startDegreeOffset: 45, //หมุน
                ),
              ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                "Data",
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
    );
  }
}
