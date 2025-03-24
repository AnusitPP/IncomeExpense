import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:income/page/main_page.dart';
import 'package:provider/provider.dart';
import 'package:income/transaction_provider.dart';  // เพิ่มการนำเข้า Provider

void main() {
  
  runApp(
    // ใช้ ChangeNotifierProvider สำหรับให้ทุกหน้าสามารถเข้าถึงข้อมูลจาก TransactionProvider ได้
    ChangeNotifierProvider(
      create: (context) => TransactionProvider(),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(), // ใช้ฟอนต์ Poppins ทั้งแอป
      ),
      home: MainPage(),
    );
  }
}
